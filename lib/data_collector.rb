require_relative 'web_scraping'

class DataCollector

    def initialize
        @web = WebScraping.new
    end

    def start
        @web.getInfo
    end
end