module Lyrics
  module Providers
    class Lyricsmania < Base
      private

      def prepare
        @artist.downcase!
        @title.downcase!

        rules = [
          ['?', '%3F'],
          ["'", ''],
          [/[ _@"]/, '_']
        ]
        rules.each do |pattern, sub|
          @artist.gsub!(pattern, sub)
          @title.gsub!(pattern, sub)
        end
      end

      def url
        "http://www.lyricsmania.com/#{title}_lyrics_#{artist}.html"
      end

      def extract
        doc.css('.lyrics-body')[0].inner_html
      end

      def clean
        super

        doc.css('#video-musictory').remove
        doc.css('strong').remove
      end
    end
  end
end
