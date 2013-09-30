RSpec::Matchers.define :a_link_with do |expected|
  match do |actual|
    actual.is_a?(BitlyExporter::Link) && (actual.link == expected)
  end
  description do
    "a short link '#{expected}'"
  end
end