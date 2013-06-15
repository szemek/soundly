class TracksController < ApplicationController
  def index
    render :text => Lastfm::User.get_recent_tracks
  end
end
