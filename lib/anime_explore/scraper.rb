require 'httparty'
require 'pry'
require "./lib/anime_explore/anime.rb"
# class AnimeExplore::Scraper
#     attr_accessor :year
#     @@all = []

#     def initialize(year)
#         @year = year
#         parse
#     end

#     def parse
#         response = HTTParty.get("https://kitsu.io/api/edge/anime?filter[#{@year}]=2021")
#         response

# end
response = HTTParty.get('https://kitsu.io/api/edge/anime?filter[year]=2021')
@hello = []
#binding.pry
def first_test(url)
    response = HTTParty.get(url)
    while response["links"]['next']
        puts response["links"]['next']
        response = HTTParty.get(response["links"]['next'])
        response['data'].each do |anime|
            #@hello << anime["id"]
            #@hello << anime["attributes"]["canonicalTitle"]
            AnimeExplore::Anime.new(anime["attributes"]["canonicalTitle"],anime["attributes"]["description"],2021)
        end
    end
  #  binding.pry
    list = ["first","last"]
    list.each do |keyword|
        response = HTTParty.get(response["links"][keyword])
        response['data'].each do |anime|
            @hello << anime["id"]
            @hello << anime["attributes"]["canonicalTitle"]
        end
    end
end

binding.pry

#anime[1][0]["attributes"]["canonicalTitle"] Title of Anime
#anime[1][0]["attributes"]["description"] Anime Description
#anime[1][0]["attributes"]["popularityRank"] Popularity Rank

