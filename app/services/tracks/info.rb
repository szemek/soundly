module Tracks
  class Info
    def self.total_tracks
      recent_tracks = Lastfm::User.get_recent_tracks
      recent_tracks["recenttracks"]["@attr"]["total"].to_i
    end
  end
end
