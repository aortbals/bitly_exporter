require File.dirname(__FILE__) + '/../spec_helper'

describe BitlyExporter::Client do
  let(:oauth_token) { "asdlkfjasd134i1ojfasldkrj234aslkdjfq3249" }
  subject { BitlyExporter::Client.new(oauth_token) }

  it "assigns oauth_token" do
    subject { assigns(:oauth_token).to eq(oauth_token) }
  end

  it "assigns params" do
    subject { assigns(:params).to eq({ access_token: oauth_token}) }    
  end

  describe "#make_request" do
    let(:api_url) { BitlyExporter::Client::API_URL }
    let(:endpoint) { 'test' }
    let(:body) { '{ "key":"value" }' }
    let(:hash) { JSON.parse(body) }
    let(:response) { double( code: 200, body: body) }

    before do
      HTTParty.stub(:get).with("#{api_url}#{endpoint}", query: subject.params).and_return(response)
    end

    it "returns a parsed response body" do
      expect(subject.send(:make_request, endpoint)).to include(hash)
    end

    context "bad request" do
      let(:response) { double(code: 404, body: body, message: 'No endpoint!') }

      it "raises an exception" do
        expect { subject.send(:make_request, endpoint) }.to raise_error(StandardError)
      end
    end
  end
end