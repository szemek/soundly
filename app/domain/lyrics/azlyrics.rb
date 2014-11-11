require 'open-uri'

module Lyrics
  class Azlyrics
    def initialize(artist, title)
      @artist = artist.downcase.gsub(/\W/, '')
      @title = title.downcase.gsub(/\W/, '')
    end

    def lyrics
      begin
        url = "http://www.azlyrics.com/lyrics/#{@artist}/#{@title}.html"
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
  end
end
