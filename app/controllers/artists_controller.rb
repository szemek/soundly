class ArtistsController < ApplicationController
  respond_to :html, :json

  def index
    @artists = Track.distinct('artist.name').sort

    respond_with(@artists)
  end

  def show
    @artist = params[:id]
    @tracks = Track.where('artist.name' => @artist).uniq(&:name).sort_by(&:name)

    respond_with({artist: @artist, tracks: @tracks})
  end
end
