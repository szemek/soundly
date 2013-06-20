class TracksController < ApplicationController
  respond_to :html, :json

  def index
    @tracks = TrackDecorator.decorate_collection(Track.order_by(uts: 'desc'))

    respond_with(@tracks)
  end

  def update
    @track = Track.find_by(mbid: params[:mbid])
  end
end
