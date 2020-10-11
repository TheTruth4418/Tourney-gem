class CLI

    def initialize
        p "Welcome to my tournament event search tool!"
    end

    def start
        Tourneys.new.list
        reciever
        choice = gets.chomp.to_i
        num = choice - 1

       if choice > 0 && choice < 6
            tourney = Tourneys.names[num]
            Details.new(tourney).tourney_details
            start
       elsif choice < 0  || choice >= 7
            error
       elsif choice == 0
            puts "Thank you for using my search!"
       elsif choice == 6
            puts "What tournament you looking for? Enter the tourney with a space in between each word!"
            choice = gets.chomp.to_s
            Details.new(choice).tourney_details
            start
       end
#aye
    end

    def reciever
        puts "Press the number to see the events it includes! Type 6 to type in your own, or 0 to exit!"
    end

    def error 
        puts "Not a valid selection please try again!"
        start
    end

end

