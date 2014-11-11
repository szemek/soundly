module Lyrics
  class Lyricswikia < Provider
    private

    def prepare
      @artist.downcase!
      @title.downcase!

      rules = [
        ['?', '%3F'],
        ["'", '%27'],
        [/[ _@"]/, '_']
      ]
      rules.each do |pattern, sub|
        @artist.gsub!(pattern, sub)
        @title.gsub!(pattern, sub)
      end
    end

    def url
      "http://lyrics.wikia.com/#{artist}:#{title}"
    end

    def extract
      doc.css('.lyricbox')[0].inner_html
    end
  end
end
