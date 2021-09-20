class AnimeExplore::CLI
    attr_accessor :animesort
    def call
        puts "Welcome to the Anime Explore App!"
        puts "Here you can learn more about which anime is popular as well as some neat data!"
        ask_date
    end

    def ask_date
        puts "Please enter a year that you'd like to learn more about"
        input = gets.chomp().to_i
        until input.between?(1907,Time.now.year)
            puts "Please enter a valid year"
            input = gets.chomp().to_i
        end
        AnimeExplore::Scraper.new(input)
        anime_count(input)
    end

    def anime_count(input)
        puts "-------------------------------------------"
        puts "In #{input}, #{AnimeExplore::Anime.all.length} anime have been released!"
        if AnimeExplore::Anime.all.length > 0 then topyear else ask_date end
    end

    def topyear
        @animesort = AnimeExplore::Anime.all.sort_by {|pop| pop.popularityrank}
        puts "-------------------------------------------"
        puts "Top anime from this year"
        counter = 0
        while counter < 5
            puts "#{counter+1}. #{@animesort[counter].name}"
            break if counter+1 == @animesort.size
            counter += 1
        end
        puts "-------------------------------------------"
        puts "To learn more about one of the anime here, please enter a number from the list"
        input = gets.chomp().to_i
        until input.between?(1,counter)
            puts "Please enter a valid number from 1 to #{counter}"
            input = gets.chomp().to_i
        end
        anime_info(input-1)
    end

    def anime_info(listnumber)
        puts "-------------------------------------------"
        puts "Name:        #{@animesort[listnumber].name}"
        puts "Description: #{@animesort[listnumber].desc}"
        puts "Episodes:    #{@animesort[listnumber].episodecount}"
        puts "Status:      #{@animesort[listnumber].status}"
        puts "Start Date:  #{@animesort[listnumber].startDate}"
        puts "End Date:    #{@animesort[listnumber].startDate}"
        puts "-------------------------------------------"
        puts "Would you like to see information on another Anime from that year? (y/n)"
        input = gets.chomp().downcase
        if input == "y"
            topyear
        else
            puts "Would you like to see information on another year? (y/n)"
            input = gets.chomp().downcase
            if input == "y"
                AnimeExplore::Anime.destroy
                ask_date
            else
                puts "Thank you, have a great day!"
                exit
            end
        end
    end
end

# CLI.new().call
# binding.pry
