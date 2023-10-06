require 'mechanize'
#require 'nokogiri'

class WebScraping

    def initialize()
        @agent = Mechanize.new
        @degree_list = @agent.get('https://gpadmissions.osu.edu/programs/')
        @degree_array = Array.new
    end

    def getName
        degree_prgm = @degree_list.css("div[style='padding:0 0 18px 0']")
        degree_prgm.each do
            degree = degree_prgm.css("div[style='margin:4px 0 0 30px; text-indent: -10px']").css('a')
            puts degree
        end
        #puts degree_prgm
    end

    def getPhone
    end
    
    def getWebsite
    end
end