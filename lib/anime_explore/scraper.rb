class AnimeExplore::Scraper
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
        puts "Please give some time for the data to load"
        response = HTTParty.get("https://kitsu.io/api/edge/anime?filter[year]=#{@year}")
        response['data'].each do |anime|
            AnimeExplore::Anime.new(anime["attributes"]["canonicalTitle"],anime["attributes"]["description"],@year, anime["attributes"]["popularityRank"],anime["attributes"]["episodeCount"],anime["attributes"]["status"],anime["attributes"]["startDate"],anime["attributes"]["endDate"])
        end
        while response["links"]['next']
            response = HTTParty.get(response["links"]['next'])
            response['data'].each do |anime|
                AnimeExplore::Anime.new(anime["attributes"]["canonicalTitle"],anime["attributes"]["description"],@year, anime["attributes"]["popularityRank"],anime["attributes"]["episodeCount"],anime["attributes"]["status"],anime["attributes"]["startDate"],anime["attributes"]["endDate"])
            end
        end
    end
end
#Scraper.new(2021)
# binding.pry