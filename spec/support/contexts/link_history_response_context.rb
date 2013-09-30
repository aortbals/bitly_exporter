shared_context "link history response" do
  let(:result_count) { 2 }
  let(:response) {
    { "data" =>
      {
        "result_count" => result_count,
        "link_history" => [
          {
            "aggregate_link" => "http://4sq.com/bGUucR",
            "archived" => false,
            "client_id" => "a5a2e024b030d6a594be866c7be57b5e2dff9972",
            "created_at" => 1331669360,
            "link" => "http://4sq.com/xnRb5V",
            "long_url" => "http://foursquare.com/",
            "modified_at" => 1331669360,
            "private" => false,
            "title" => nil,
            "user_ts" => 1331669360
          },
          {
            "aggregate_link" => "http://nyti.ms/16tOHV",
            "archived" => false,
            "client_id" => "a5a2e024b030d6a594be866c7be57b5e2dff9972",
            "created_at" => 1331669349,
            "link" => "http://nyti.ms/xr5jgq",
            "long_url" => "http://nytimes.com/",
            "modified_at" => 1331669350,
            "private" => false,
            "title" => "The New York Times - Breaking News, World News & Multimedia",
            "user_ts" => 1331669349
          }
        ]
      }
    }
  }
  let(:link_data)   { response["data"]["link_history"][0] }
  let(:link_data_2) { response["data"]["link_history"][1] }
end
