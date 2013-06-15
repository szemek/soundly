class Tracks::Updater
  def self.run
    tracks_per_page = 200

    pages, rest = total_tracks.divmod(tracks_per_page)
    pages += 1 if rest > 0

    (1..pages).each do |page|
      recent_tracks = Lastfm::User.get_recent_tracks(limit: tracks_per_page, page: page)
      tracks = recent_tracks["recenttracks"]["track"]

      tracks.each do |track|
        item = Track.find_or_create_by(mbid: track["mbid"], name: track["name"])
      end
    end
  end

  def self.total_tracks
    recent_tracks = Lastfm::User.get_recent_tracks
    recent_tracks["recenttracks"]["@attr"]["total"].to_i
  end
end
