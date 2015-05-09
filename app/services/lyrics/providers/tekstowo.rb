module Lyrics
  module Providers
    class Tekstowo < Base
      private

      def prepare
        @artist.downcase!
        @title.downcase!

        rules = [
          ['?', '%3F'],
          [/[ _@"']/, '_']
        ]
        rules.each do |pattern, sub|
          @artist.gsub!(pattern, sub)
          @title.gsub!(pattern, sub)
        end
      end

      def url
        "http://www.tekstowo.pl/piosenka,#{artist},#{title}.html"
      end

      def extract
        doc.css('.song-text')[0].inner_html
      end

      def clean
        super

        doc.css('a').remove
        doc.css('h2').remove
        doc.css('p').remove
        doc.css('#song_revisions').remove
      end
    end
  end
end
