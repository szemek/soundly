module Lyrics
  class Azlyrics < Provider
    private

    def prepare
      @artist.downcase!.gsub!(/\W/, '')
      @title.downcase!.gsub!(/\W/, '')
    end

    def url
      "http://www.azlyrics.com/lyrics/#{artist}/#{title}.html"
    end

    def extract
      doc.css('[style="margin-left:10px;margin-right:10px;"]').inner_html
    end
  end
end
