require 'mechanize'
#require 'nokogiri'

class WebScraping

    def initialize()
        @agent = Mechanize.new
        @page = @agent.get('https://gpadmissions.osu.edu/programs/')
        @degrees = @page.css("div[style='padding:0 0 18px 0']").css("div[style='margin:4px 0 0 30px; text-indent: -10px']").css('a')
        @degree_array = Hash.new { |h, k| h[k] = [] }
    end

    def getInfo
        i = 0
        until @degrees.length == 0
            degree = @degrees.shift
            name = degree.inner_text
            if name.include?("Doctor")
                @degree_array[i][0] = name
                link = degree.attr("href")
                newPage = @agent.get(link)
                info = newPage.css("section[class='callout callout-program-info complimentary']").css('div').css('p')
                getPhone(info, i)
                getWebsite(info, i)
                i += 1
            end
        end
    end

    private def getPhone(info, i)
        info = info.inner_text
        index = info.index('Phone: ')
        if info.slice(info.index('Phone: '), 19) =~ /\d/
            phone = info.slice(info.index('Phone: '), 19).slice(7, 12)
            @degree_array[i][1] = phone
        else
            @degree_array[i][1] = "NULL"
        end
    end
    
    private def getWebsite(info, i)
        website = info.css("a[target='_blank']").first['href']
        @degree_array[i][2] = website
    end
    
    def extracted_data
    	@degree_array.values
    end
end
