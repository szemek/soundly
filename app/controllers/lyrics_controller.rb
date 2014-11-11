class LyricsController < ApplicationController
  def index
    lyrics = ""
    no_lyrics = "No lyrics found"

    artist = params[:artist]
    title = params[:title]

    providers = [Lyrics::Azlyrics, Lyrics::Lyricswikia]
    providers.each do |provider|
      instance = provider.new(artist, title)
      lyrics = instance.lyrics

      break if lyrics != no_lyrics
    end

    render text: lyrics
  end
end
