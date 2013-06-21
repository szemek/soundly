class Tracks::Updater
  @@tracks_per_page = 200

  def self.run(update_type = nil)
    pages = case update_type
    when :complete_update then complete_update
    when :diff_update then diff_update
    else diff_update
    end

    (1..pages).each do |page|
      Rails.logger.info "#{page}/#{pages}"
      update_page(page)
    end
  end

  def self.complete_update
    pages, rest = Tracks::Info.total_tracks.divmod(@@tracks_per_page)
    pages += 1 if rest > 0

    pages
  end

  def self.diff_update
    diff = Tracks::Info.total_tracks - Track.count
    pages, rest = diff.divmod(@@tracks_per_page)
    pages += 1 if rest > 0

    pages
  end

  def self.update_page(page)
    recent_tracks = Lastfm::User.get_recent_tracks(limit: @@tracks_per_page, page: page)
    tracks = recent_tracks["recenttracks"]["track"]

    tracks.each do |track|
      update_track(track)
    end
  end

  def self.update_track(track)
    # skip track being played
    return if track['date'].nil?
    single = Track.find_or_initialize_by(mbid: track['mbid'], name: track['name'], uts: track['date']['uts'])
    # skip track if artist & album are set
    return if single.artist && single.album
    single.artist = Artist.new(mbid: track['artist']['mbid'], name: track['artist']['#text'])
    single.album = Album.new(mbid: track['album']['mbid'], name: track['album']['#text'])
    single.save
  end
end
