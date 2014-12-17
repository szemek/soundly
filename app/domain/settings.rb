class Settings
  def self.lastfm_api_key
    ENV.fetch('LASTFM_API_KEY')
  end

  def self.lastfm_secret
    ENV.fetch('LASTFM_SECRET')
  end
end
