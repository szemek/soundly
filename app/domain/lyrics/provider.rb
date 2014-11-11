require 'open-uri'

module Lyrics
  class Provider
    attr_accessor :artist, :title
    attr_accessor :doc

    def initialize(artist, title)
      @artist = artist.clone
      @title = title.clone
    end

    def lyrics
      begin
        prepare
        fetch
        clean
        extract
      rescue Exception, :as => e
        puts "#{self.class}".yellow
        puts "Exception: #{e.message}".red
      end
    end

    private

    def fetch
      puts "GET #{url}".blue
      @doc = Nokogiri::HTML(open(url))
    end

    def clean
      # remove specific elements
      doc.css('.rtMatcher').remove
      doc.css('.lyricsbreak').remove
      # remove comments
      doc.xpath('//comment()').remove
      # remove JavaScript
      doc.css('script').remove
    end
  end
end
