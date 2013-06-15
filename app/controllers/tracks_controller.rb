require 'open-uri'
class TracksController < ApplicationController
  def index
    response = RestClient.get "http://ws.audioscrobbler.com/2.0/", {
      :params => {
        method: 'user.getrecenttracks',
        user: 'przemyslawdabek',
        api_key: Settings.lastfm_api_key,
        format: 'json',
        limit: 1
      }
    }
    render :text => response.to_s
  end
end
