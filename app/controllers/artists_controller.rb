class ArtistsController < ApplicationController
  def index
    @artists = Track.distinct('artist.name').sort
  end

  def show
    @artist = params[:id]
    @tracks = Track.where('artist.name' => @artist).uniq(&:name).sort_by(&:name)
  end
end
