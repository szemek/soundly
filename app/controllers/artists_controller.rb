class ArtistsController < ApplicationController
  def index
    @artists = Track.distinct('artist.name').sort
  end
end
