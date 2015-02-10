module Lyrics
  class Fetcher
    attr_accessor :artist, :title

    def initialize(args)
      @artist = args[:artist]
      @title = args[:title]
    end

    def get
      providers = [Lyrics::Azlyrics, Lyrics::Lyricswikia]
      providers.each do |provider|
        instance = provider.new(artist: artist, title: title)
        lyrics = instance.lyrics

        return lyrics if lyrics.present?
      end

      "Lyrics not found"
    end
  end
end
