Bitly Exporter
==============

[![Code Climate](https://codeclimate.com/github/aortbals/bitly_exporter.png)](https://codeclimate.com/github/aortbals/bitly_exporter) [![Coverage Status](https://coveralls.io/repos/aortbals/bitly_exporter/badge.png?branch=master)](https://coveralls.io/r/aortbals/bitly_exporter?branch=master)

This gem exports a user's links from the Bitly V3 API. It requires a generic OAuth access token that you can [obtain from Bitly](https://bitly.com/a/oauth_apps). It makes use of the [User Link History API](http://dev.bitly.com/user_info.html#v3_user_link_history).


Installation
------------

Add this line to your applications Gemfile:

    gem 'bitly_exporter', github: 'aortbals/bitly_exporter'

Or install it directly:

    gem install bitly_exporter


Usage
-----

First, create a user and an exporter:

    user = BitlyExporter::User.new('youroauthaccesstoken')
    exporter = BitlyExporter::Exporter.new(user)

The `export` method triggers the export. There are two ways to consume the results.

Using a block:

```ruby
exporter.export do |link|
  # Create a record, store the link, etc
end
```

As a traditional method:

```ruby
results = exporter.export

results.each_with_index do |link, index|
  puts "Link Index: #{index}, Link: #{link.link}"
end
```

`export` takes two optional arguments: `progress` & `max`. Set `progress` to `true` to see progress while exporting. Setting `max` will import (in increments of 100) up to the maximum specified. This is a good way to see a sample response.

Show progress:

```ruby
results = exporter.export(true)
```

With max:

```ruby
exporter.export(false, 200) do |link|
  # Create a record, store the link, etc
end
```

#### Link Objects ####

See the [API docs](http://dev.bitly.com/user_info.html#v3_user_link_history) for more information. A link object has the following methods:

- link (short_link)
- long_url
- aggregate\_link (global\_bitly\_identifier)
- archived
- title
- private
- client_id
- created_at
- modified_at
- user_ts


Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Write Tests
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request


License
-------

This code is provided under the MIT license.  See LICENSE for more details.
