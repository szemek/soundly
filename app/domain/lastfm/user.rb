module Lastfm
  class User
    def self.get_recent_tracks(user: 'przemyslawdabek', limit: 1, page: 1)
      response = RestClient.get "http://ws.audioscrobbler.com/2.0/", {
        :params => {
          api_key: Settings.lastfm_api_key,
          method: 'user.getrecenttracks',
          user: user,
          page: page,
          limit: limit,
          format: 'json'
        }
      }

      JSON.parse(response)
    end
  end
end
