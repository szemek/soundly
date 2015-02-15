module Lyrics
  class Fetcher
    attr_accessor :artist, :title

    def initialize(args)
      @artist = args[:artist]
      @title = args[:title]
    end

    def get
      providers.each do |provider|
        instance = provider.new(artist: artist, title: title)
        lyrics = instance.lyrics

        return lyrics if lyrics.present?
      end

      "Lyrics not found"
    end

    private

    def providers
      [
        Lyrics::Providers::Azlyrics,
        Lyrics::Providers::Lyricswikia,
        Lyrics::Providers::Lyricsmania,
        Lyrics::Providers::Tekstowo,
        Lyrics::Providers::Metrolyrics,
      ]
    end
  end
end
