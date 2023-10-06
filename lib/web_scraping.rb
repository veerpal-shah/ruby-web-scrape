<<<<<<< HEAD
=======
require 'mechanize'
#require 'nokogiri'

class WebScraping

    def initialize()
        @agent = Mechanize.new
        @degree_list = @agent.get('https://gpadmissions.osu.edu/programs/')
        @degree_array = Array.new
    end

    def getName
        degrees = @degree_list.css("div[style='padding:0 0 18px 0']").css("div[style='margin:4px 0 0 30px; text-indent: -10px']").css('a')
        i = 0;
        until degrees.length == 0
            degree = degrees.shift.inner_text
            if degree.include?("Doctor")
                @degree_array[i] = degree
                i += 1
            end
        end
        puts @degree_array
    end

    def getPhone
    end
    
    def getWebsite
    end
end
>>>>>>> fa8524611372130f162f36462e110c84191e0e5b
