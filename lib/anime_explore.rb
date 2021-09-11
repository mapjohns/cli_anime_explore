# frozen_string_literal: true

require_relative "anime_explore/version"
require_relative "anime_explore/cli"
require_relative "anime_explore/scraper"
require_relative "anime_explore/anime"

require 'pry'
require 'httparty'

module AnimeExplore
  class Error < StandardError; end
  # Your code goes here...
end
