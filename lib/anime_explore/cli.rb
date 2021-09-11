require 'pry'
require "./lib/anime_explore/scraper.rb"
require "./lib/anime_explore/anime.rb"
class CLI

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
    end

# 1. Asks for year -> Length

#If yes on another Year, destroy data in Anime, if no exit program


end

CLI.new().call
binding.pry


