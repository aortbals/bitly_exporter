require_relative '../spec_helper'
require_relative '../shared/oauth_context'
require_relative '../shared/link_history_response_context'

describe BitlyExporter::User do
  include_context 'oauth'

  before do
    BitlyExporter::User.any_instance.stub(:make_request).and_return(response)
  end
    
  subject { BitlyExporter::User.new(oauth_token) }

  describe '#link_history' do
    include_context 'link history response'

    it "creates links" do
      BitlyExporter::Link.should_receive(:new).twice
      subject.link_history
    end

    it "returns result_count with links" do
      expect(subject.link_history).to include(result_count)
    end
  end

  describe '#info' do
    let(:response) { double().as_null_object }

    it 'requests user info' do
      subject.should_receive(:make_request).with("/user/info")
      subject.info
    end
  end
end