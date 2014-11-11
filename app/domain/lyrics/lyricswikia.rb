module Lyrics
  class Lyricswikia < Provider
    def prepare_url
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

    def lyrics
      super

      begin
        puts "GET #{url}"
        html = open(url).read
        doc = Nokogiri::HTML(html)
        # remove .rtMatcher classes
        doc.search('.rtMatcher').remove
        # remove comments
        doc.xpath('//comment()').remove
        # remove JavaScript
        doc.css('script').remove
        doc.css('.lyricsbreak').remove

        lyrix = doc.css('.lyricbox')[0].inner_html
      rescue Exception, :as => e
        puts "Exception: #{e.message}"
      ensure
        lyrix ||= "No lyrics found"
      end

      lyrix
    end

    def url
      "http://lyrics.wikia.com/#{artist}:#{title}"
    end
  end
end
