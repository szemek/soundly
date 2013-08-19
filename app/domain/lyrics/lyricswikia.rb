# encoding: utf-8
require 'open-uri'
require 'nokogiri'

class Lyricswikia
  def initialize(artist, title)
    @artist = artist.downcase
    @title = title.downcase
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
    begin
      url = "http://lyrics.wikia.com/#{@artist}:#{@title}"
      puts "GET #{url}"
      html = open(url).read
      doc = Nokogiri::HTML(html)
      # remove .rtMatcher classes
      doc.search('.rtMatcher').remove
      # remove comments
      doc.xpath('//comment()').remove
      lyrix = doc.css('.lyricbox')[0].inner_html
    rescue Exception, :as => e
      puts "Exception: #{e.message}"
    ensure
      lyrix ||= "No lyrics found"
    end

    lyrix
  end
end
