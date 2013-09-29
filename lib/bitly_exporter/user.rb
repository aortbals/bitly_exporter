module BitlyExporter
  class User < Client 
    def link_history(options={})
      result = make_request("/user/link_history", options)
      result_count = result["data"]["result_count"]
      result_links = result["data"]["link_history"]
      
      links = result_links.collect do |link|
        Link.new(link)
      end
      
      return links, result_count
    end

    def info(options={})
      make_request("/user/info")
    end
  end
end
