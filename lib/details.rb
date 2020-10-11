class Details
attr_accessor :tourney_name, :games
    def initialize(tourney_name)
        @tourney_name = tourney_name
        @name = tourney_name.split(" ")
        @name_link = []
        @games = []
        @name.each do |x| 
            x = x.tr('#', '')
            @name_link << x if !(x == " " || x == "-")
        end

        scrape_details
    end

    def scrape_details
        #puts the name in web format so I can open the page
        link = @name_link.join("-").downcase
        doc = Nokogiri::HTML(open("https://smash.gg/tournament/#{link}/events"))

        #scraping the games
        doc.css("div.sgg1XcrV h4 a").each do |game|
            @games << game.text
        end
        
    end

    def games_list
        @games.join(", ")
    end

    def tourney_details
        puts ""
        puts "The events that will be at #{@tourney_name} are: " + games_list
        puts ""
    end

end
# name doc.css("div.sgg1XcrV h4 a").text