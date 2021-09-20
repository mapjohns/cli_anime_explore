class AnimeExplore::Anime
attr_reader :name, :desc, :year, :popularityrank, :episodecount, :status, :startDate, :endDate
@@all = []
    def initialize(name, desc, year, popularityrank, episodecount,status, startDate, endDate)
        @name = name
        @desc = desc
        @year = year
        @popularityrank = popularityrank
        @episodecount = episodecount
        @status = status
        @startDate = startDate
        @endDate = endDate
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
