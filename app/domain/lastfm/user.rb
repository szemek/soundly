module Lastfm
  class User
    def self.get_recent_tracks
      response = RestClient.get "http://ws.audioscrobbler.com/2.0/", {
        :params => {
          method: 'user.getrecenttracks',
          user: 'przemyslawdabek',
          api_key: Settings.lastfm_api_key,
          format: 'json',
          limit: 1
        }
      }
      JSON.parse(response)
    end
  end
end
