# require "./lib/anime_explore/scraper.rb"
# require "./lib/anime_explore/cli.rb"
require 'pry'
class Anime
attr_reader :name, :desc, :year, :popularityrank
@@all = []
    def initialize(name, desc, year, popularityrank)
        @name = name
        @desc = desc
        @year = year
        @popularityrank = popularityrank
        save
    end
    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy
        @@all.clear()
    end
end
