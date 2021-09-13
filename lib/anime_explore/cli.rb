require 'pry'
require "./lib/anime_explore/scraper.rb"
require "./lib/anime_explore/anime.rb"
class CLI
    attr_accessor :animesort
    def call
        puts "Welcome to the Anime Explore App!"
        puts "Here you can learn more about which anime is popular as well as some neat data!"
        ask_date
    end
    def ask_date
        puts "To begin, please enter a year that you'd like to learn more about"
        input = gets.chomp().to_i
        until input.between?(1905,Time.now.year)
            puts "Please enter a valid year"
            input = gets.chomp().to_i
        end
        Scraper.new(input)
        anime_count(input)
    end

    def anime_count(input)
        puts "In #{input}, #{Anime.all.length} anime have been released!"
        topyear
    end

    def topyear
        @animesort = Anime.all.sort_by {|pop| pop.popularityrank}
        #Top 5 anime
        puts "Top anime from this year"
        counter = 0
        while counter < 5
            puts "#{counter+1}. #{@animesort[counter].name}"
            counter += 1
        end
        puts "If you'd like to learn more about one of the anime here, please enter a number from the list"
        inputnumber = gets.chomp().to_i
        anime_info(inputnumber-1)
    end

    def anime_info(listnumber)
        puts @animesort[listnumber].name
        puts @animesort[listnumber].desc
        puts @animesort[listnumber].popularityrank
    end
end
#find/detect

 # @animesort[0].name   
# collect and remove duplicates
# 1. Asks for year -> Length

#If yes on another Year, destroy data in Anime, if no exit program
# Anime.all.sort_by {|pop| pop.popularityrank}
        # 3,2,1
        # 

#binding.pry

CLI.new().call
binding.pry


# Remove duplicates
# 