require 'open-uri'

module Lyrics
  class Provider
    attr_accessor :artist, :title
    attr_accessor :doc

    def initialize(artist, title)
      @artist = artist.clone
      @title = title.clone
    end

    def lyrics
      prepare_url
    end
  end
end
