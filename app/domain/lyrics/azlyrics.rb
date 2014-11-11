module Lyrics
  class Azlyrics < Provider
    def prepare_url
      @artist.downcase!.gsub!(/\W/, '')
      @title.downcase!.gsub!(/\W/, '')
    end

    def lyrics
      super

      begin
        puts "GET #{url}"
        html = open(url).read
        doc = Nokogiri::HTML(html)
        # remove JavaScript
        doc.css('script').remove
        lyrix = doc.css('[style="margin-left:10px;margin-right:10px;"]').inner_html
      rescue Exception, :as => e
        puts "Exception: #{e.message}"
      ensure
        lyrix ||= "No lyrics found"
      end

      lyrix
    end

    def url
      "http://www.azlyrics.com/lyrics/#{@artist}/#{@title}.html"
    end
  end
end
