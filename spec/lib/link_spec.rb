require_relative '../spec_helper'
require_relative '../shared/link_history_response_context'

describe BitlyExporter::Link do
  include_context 'link history response'
  let(:data) { response["data"]["link_history"][0] }

  subject { BitlyExporter::Link.new(data) }

  it 'assigns attributes' do
    expect(subject.link).to           eq(data["link"])
    expect(subject.long_url).to       eq(data["long_url"])
    expect(subject.aggregate_link).to eq(data["aggregate_link"])
    expect(subject.title).to          eq(data["title"])
    expect(subject.private).to        eq(data["private"])
    expect(subject.created_at).to     eq(Time.at(data["created_at"]))
    expect(subject.modified_at).to    eq(Time.at(data["modified_at"]))
  end

  context "missing data" do
    let(:data) {
      {
        "link" => "http://4sq.com/xnRb5V",
        "long_url" => "http://foursquare.com/"
      }
    }

    it "creates the link with data provided" do
      expect(subject.link).to           eq(data["link"])
      expect(subject.long_url).to       eq(data["long_url"])
      expect(subject.aggregate_link).to be_nil
    end
  end
end