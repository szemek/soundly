class LyricsController < ApplicationController
  def index
    artist = params[:artist]
    title = params[:title]

    providers = [Azlyrics, Lyricswikia]
    providers.each do |provider|
      instance = provider.new(artist, title)
      lyrix = instance.lyrics

      break if lyrix != "No lyrics found"
    end

    render text: lyrix
  end
end