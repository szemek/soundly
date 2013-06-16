class Tracks::Updater
  def self.run
    tracks_per_page = 200

    pages, rest = total_tracks.divmod(tracks_per_page)
    pages += 1 if rest > 0

    (1..pages).each do |page|
      Rails.logger.info "#{page}/#{pages}"

      recent_tracks = Lastfm::User.get_recent_tracks(limit: tracks_per_page, page: page)
      tracks = recent_tracks["recenttracks"]["track"]

      tracks.each do |track|
        single = Track.find_or_initialize_by(mbid: track['mbid'], name: track['name'], uts: track['date']['uts'])
        # skip track if artist & album are set
        next if single.artist && single.album
        single.artist = Artist.new(mbid: track['artist']['mbid'], name: track['artist']['#text'])
        single.album = Album.new(mbid: track['album']['mbid'], name: track['album']['#text'])
        single.save
      end
    end
  end

  def self.total_tracks
    recent_tracks = Lastfm::User.get_recent_tracks
    recent_tracks["recenttracks"]["@attr"]["total"].to_i
  end
end
