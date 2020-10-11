class Tourneys

    @@tournaments = []

    def initialize
        Tourneys.scrape_tourneys
    end

    def self.scrape_tourneys
        doc = Nokogiri::HTML(open("https://smash.gg/tournaments?per_page=30&filter=%7B%22upcoming%22%3Atrue%2C%22videogameIds%22%3A%223200%22%7D&page=1")) 
        
        doc.css("div.TournamentCardContainer").each do |tourney|
           name = tourney.css("div.TournamentCardHeading__title").text
           @@tournaments << name
        end
    end

    def self.names
        @@tournaments.slice(0,5)
    end

    def list 
        count = 1
            Tourneys.names.each do |name|
                puts "#{count}. #{name}"
                count += 1
            end
    end
end






#tourneys: doc.css("div.TournamentCardContainer")


