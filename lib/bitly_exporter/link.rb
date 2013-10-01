module BitlyExporter
  class Link
    attr_reader  :link, :long_url, :aggregate_link, :archived, :title, :private, :client_id,
      :created_at, :modified_at, :user_ts
    alias_method :short_link, :link
    alias_method :global_bitly_identifier, :aggregate_link

    def initialize(data={})
      if data
        @link           = data["link"]
        @long_url       = data["long_url"]
        @aggregate_link = data["aggregate_link"]
        @archived       = data["archived"] 
        @title          = data["title"]
        @private        = data["private"]
        @client_id      = data["client_id"]
        @created_at     = Time.at(data["created_at"])   if data["created_at"]
        @modified_at    = Time.at(data["modified_at"])  if data["modified_at"]
        @user_ts        = Time.at(data["user_ts"])      if data["user_ts"]
      end
    end
  end
end
