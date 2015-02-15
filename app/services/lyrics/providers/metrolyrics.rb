module Lyrics
  module Providers
    class Metrolyrics < Base
      private

      def prepare
        @artist.downcase!
        @title.downcase!

        @artist = parameterize(@artist)
        @title = parameterize(@title)
      end

      def url
        "http://www.metrolyrics.com/#{title}-lyrics-#{artist}.html"
      end

      def extract
        doc.css('#lyrics-body-text')[0].inner_html
      end
    end
  end
end
