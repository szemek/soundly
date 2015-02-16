module Lyrics
  module Providers
    class Songlyrics < Base
      private

      def prepare
        @artist.downcase!
        @title.downcase!

        @artist = parameterize(@artist)
        @title = parameterize(@title)
      end

      def url
        "http://www.songlyrics.com/#{artist}/#{title}-lyrics/"
      end

      def extract
        doc.css('#songLyricsDiv')[0].inner_html
      end
    end
  end
end
