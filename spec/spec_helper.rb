require 'coveralls'
Coveralls.wear! if ENV["COVERAGE"]

require 'bitly_exporter'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.before(:each) do
    BitlyExporter::Exporter.any_instance.stub(:sleep)
  end
end