require_relative '../spec_helper'
require_relative '../support/contexts/oauth_context'
require_relative '../support/contexts/link_history_response_context'
require_relative '../support/matchers/a_link_with_matcher'

describe BitlyExporter::Exporter do
  include_context 'oauth'
  include_context 'link history response'
  let(:empty_response) {
    { "data" => {
        "result_count" => 0, "link_history" => []
      }
    }
  }
  let(:user) { BitlyExporter::User.new(oauth_token) }

  before do
    BitlyExporter::User.any_instance.stub(:make_request).and_return(response, empty_response)
  end

  subject { BitlyExporter::Exporter.new(user) }

  it "takes a user" do
    expect(subject.user).to be(user)
  end

  describe '#export' do
    it "returns all links" do
      expect(subject.export).to have(2).items
    end

    it "contains the first link" do
      expect(subject.export).to include(a_link_with link_data["link"])
    end

    it "contains the second link" do
      expect(subject.export).to include(a_link_with link_data_2["link"])
    end
  end
end