module BitlyExporter
  class Exporter
    LIMIT  = 100
    NO_MAX = Float::INFINITY

    attr_reader :user
    def initialize(user)
      @user = user
    end

    def export(progress=false, max=NO_MAX)
      results = []
      offset  = 0
      begin
        links, result_count = user.link_history(limit: LIMIT, offset: offset)
        links.each do |link|
          results << link
          yield link if block_given?
        end
        offset = offset + LIMIT
        sleep(0.5) # Let's not bull rush the API
        print "#{offset} links retrieved...\r" if progress
      end while links.count > 0 && offset < max
      print "Finished. #{results.count} links retrieved.\n" if progress
      results
    end
  end
end
