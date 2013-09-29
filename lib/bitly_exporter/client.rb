require 'httparty'
require 'json'

module BitlyExporter
  class Client
    include HTTParty
    
    API_URL     = "https://api-ssl.bitly.com/v3"
    API_VERSION = 3

    attr_reader :oauth_token, :params
    def initialize(oauth_token)
      @oauth_token = oauth_token
      @params = { access_token: oauth_token }
    end

    protected

    def make_request(endpoint, options={})
      response = HTTParty.get("#{API_URL}#{endpoint}", query: params.merge(options))
      if response.code == 200
        JSON.parse(response.body)
      else
        raise StandardError, "The request to bitly failed with a HTTP #{response.code}\n#{response.message}"
      end
    end    
  end
end
