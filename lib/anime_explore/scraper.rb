require 'httparty'
require 'pry'
require "./lib/anime_explore/anime.rb"
#require "./lib/anime_explore/cli.rb"
class Scraper
    attr_reader :year
    @@all = []
    def initialize(year)
        @year = year
        parse
    end

    def self.all
        @@all
    end

    def parse
        response = HTTParty.get("https://kitsu.io/api/edge/anime?filter[year]=#{@year}")
        while response["links"]['next']
            puts response["links"]['next']
            response = HTTParty.get(response["links"]['next'])
            response['data'].each do |anime|
                Anime.new(anime["attributes"]["canonicalTitle"],anime["attributes"]["description"],@year, anime["attributes"]["popularityRank"])
            end
        end
        list = ["first"]
        list.each do |keyword|
            response = HTTParty.get(response["links"][keyword])
            response['data'].each do |anime|
                Anime.new(anime["attributes"]["canonicalTitle"],anime["attributes"]["description"],@year, anime["attributes"]["popularityRank"])
            end
        end
        puts "Huge success"
    end
end
#Scraper.new(2021)
# binding.pry