module Lastfm
  class Library
    def self.get_tracks(user: 'przemyslawdabek', limit: 1, page: 1)
      response = RestClient.get "http://ws.audioscrobbler.com/2.0/", {
        :params => {
          api_key: Settings.lastfm_api_key,
          method: 'library.gettracks',
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
