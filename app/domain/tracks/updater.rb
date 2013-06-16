class Tracks::Updater
  def self.run
    tracks_per_page = 200

    pages, rest = total_tracks.divmod(tracks_per_page)
    pages += 1 if rest > 0

    (1..pages).each do |page|
      recent_tracks = Lastfm::User.get_recent_tracks(limit: tracks_per_page, page: page)
      tracks = recent_tracks["recenttracks"]["track"]

      tracks.each do |track|
        uts = track['date']['uts'].to_i
        # stop updating if track with specific uts exists
        return if Track.where(uts: uts).exists?
        single = Track.find_or_create_by(mbid: track["mbid"], name: track["name"], uts: uts)
        artist = Artist.find_or_create_by(mbid: track['artist']['mbid'], name: track['artist']['#text'])
        album = Album.find_or_create_by(mbid: track['album']['mbid'], name: track['album']['#text'])
        single.artist = artist
        single.album = album
        single.save
      end
    end
  end

  def self.total_tracks
    recent_tracks = Lastfm::User.get_recent_tracks
    recent_tracks["recenttracks"]["@attr"]["total"].to_i
  end
end
