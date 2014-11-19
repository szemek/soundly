class LyricsController < ApplicationController
  def index
    lyrics = ""

    artist = params[:artist]
    title = params[:title]

    providers = [Lyrics::Azlyrics, Lyrics::Lyricswikia]
    providers.each do |provider|
      instance = provider.new(artist: artist, title: title)
      lyrics = instance.lyrics

      break if lyrics
    end

    render text: lyrics
  end
end
