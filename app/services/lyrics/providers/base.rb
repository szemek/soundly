module Lyrics
  module Providers
    class Base
      attr_accessor :artist, :title
      attr_accessor :doc

      include ActiveSupport::Inflector

      def initialize(args)
        @artist = transliterate(args[:artist].clone)
        @title = transliterate(args[:title].clone)
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
        @doc = Nokogiri::HTML(document)
      end

      def document
        HTTParty.get(url).body
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
end
