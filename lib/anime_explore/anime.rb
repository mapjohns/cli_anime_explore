class Anime
attr_reader :name, :desc, :year
@@all = []
    def initialize(name, desc, year)
        @name = name
        @desc = desc
        @year = year
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end




# require 'httparty'
# require 'pry'
# # require "./lib/anime_explore.rb"
# # class AnimeExplore::Scraper
# #     attr_accessor :year
# #     @@all = []

# #     def initialize(year)
# #         @year = year
# #         parse
# #     end

# #     def parse
# #         response = HTTParty.get("https://kitsu.io/api/edge/anime?filter[#{@year}]=2021")
# #         response

# # end
# response = HTTParty.get('https://kitsu.io/api/edge/anime?filter[year]=2021')
# @hello = []
# #binding.pry
# def first_test(url)
#     response = HTTParty.get(url)
#     while response["links"]['next']
#         puts response["links"]['next']
#         response = HTTParty.get(response["links"]['next'])
#         response['data'].each do |anime|
#             #@hello << anime["id"]
#             #@hello << anime["attributes"]["canonicalTitle"]
#             Anime.new(anime["attributes"]["canonicalTitle"],anime["attributes"]["description"],2021)
#         end
#     end
#   #  binding.pry
#     list = ["first","last"]
#     list.each do |keyword|
#         response = HTTParty.get(response["links"][keyword])
#         response['data'].each do |anime|
#             @hello << anime["id"]
#             @hello << anime["attributes"]["canonicalTitle"]
#         end
#     end
# end

# binding.pry