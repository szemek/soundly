class LyricsController < ApplicationController
  def index
    render plain: lyrics
  end

  private

  def lyrics
    Lyrics::Fetcher.new(params).get
  end
end
