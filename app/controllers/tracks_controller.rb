class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def update
    @track = Track.find_by(mbid: params[:mbid])
  end
end
