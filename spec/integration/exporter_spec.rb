require_relative '../spec_helper'
require_relative '../support/matchers/a_link_with_matcher'

describe BitlyExporter::Exporter do
  let(:oauth_token) { "asdlkfjasd134i1ojfasldkrj234aslkdjfq3249" }
  let(:user) { BitlyExporter::User.new(oauth_token) }

  context "with a maximum" do
    let(:max) { 200 }

    subject do
      VCR.use_cassette "with maximum" do
        BitlyExporter::Exporter.new(user).export(false, 200)
      end
    end

    it "should retrieve the maximum" do
      expect(subject).to have(200).items
    end

    context "and a block" do
      subject do
        BitlyExporter::Exporter.new(user)
      end

      it "should yield 200 times" do
        VCR.use_cassette "with maximum" do
          expect { |link| subject.export(false, 200, &link) }.to yield_control.exactly(200).times
        end
      end
    end
  end

  context "no maximum" do
    subject do
      VCR.use_cassette "no maximum" do
        BitlyExporter::Exporter.new(user).export
      end
    end

    it "retrieves all of the links" do
      subject
    end
  end
end