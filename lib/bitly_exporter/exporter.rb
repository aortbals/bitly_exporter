module BitlyExporter
  class Exporter
    LIMIT  = 100
    NO_MAX = Float::INFINITY

    attr_reader :user
    def initialize(user)
      @user = user
    end

    def export(max=NO_MAX)
      results = []
      offset = 0
      begin
        links, result_count = user.link_history(limit: LIMIT, offset: offset)
        links.each do |link|
          results << link
          yield link if block_given?
        end
        offset = offset + LIMIT
      end while links.count > 0 && offset < max
      results
    end
  end
end
