module Lastfm
  class Settings
    def self.api_key
      ENV.fetch('LASTFM_API_KEY')
    end

    def self.secret
      ENV.fetch('LASTFM_SECRET')
    end
  end
end
