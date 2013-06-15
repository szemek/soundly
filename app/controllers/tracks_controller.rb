class TracksController < ApplicationController
  def index
    @tracks = Track.order_by(uts: 'desc').limit(50)
  end

  def update
    @track = Track.find_by(mbid: params[:mbid])
  end
end
