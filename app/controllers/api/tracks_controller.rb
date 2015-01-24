class Api::TracksController < ApplicationController
  def index
    tracks = Track.limit(50).order_by(uts: 'desc')

    render json: tracks
  end

  def search
    tracks = Track.or([
      {'artist.name' => pattern},
      {'album.name' => pattern},
      {'name' => pattern}
    ]).limit(50).order_by(uts: 'desc')

    render json: tracks
  end

  private

  def pattern
    @pattern ||= /.*#{params[:name]}.*/i
  end
end
