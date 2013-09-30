require_relative '../spec_helper'
require_relative '../support/contexts/link_history_response_context'

describe BitlyExporter::Link do
  include_context 'link history response'

  subject { BitlyExporter::Link.new(link_data) }

  it { expect(subject.link).to           eq(link_data["link"]) }
  it { expect(subject.long_url).to       eq(link_data["long_url"]) }
  it { expect(subject.aggregate_link).to eq(link_data["aggregate_link"]) }
  it { expect(subject.title).to          eq(link_data["title"]) }
  it { expect(subject.private).to        eq(link_data["private"]) }
  it { expect(subject.created_at).to     eq(Time.at(link_data["created_at"])) }
  it { expect(subject.modified_at).to    eq(Time.at(link_data["modified_at"])) }

  context "missing data" do
    let(:link_data) {
      {
        "link" => "http://4sq.com/xnRb5V",
        "long_url" => "http://foursquare.com/"
      }
    }

    it { expect(subject.link).to           eq(link_data["link"]) }
    it { expect(subject.long_url).to       eq(link_data["long_url"]) }
    it { expect(subject.aggregate_link).to be_nil }
    it { expect(subject.created_at).to      be_nil }
  end
end