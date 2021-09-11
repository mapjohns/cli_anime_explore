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
end
