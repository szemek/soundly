class Tracks::SearchController < ApplicationController
  respond_to :json
  def index
    pattern = /.*#{params[:name]}.*/i
    @tracks = Track.or([
      {'artist.name' => pattern},
      {'album.name' => pattern},
      {'name' => pattern}
    ]).limit(50).order_by(uts: 'desc')
    respond_with(@tracks)
  end
end
