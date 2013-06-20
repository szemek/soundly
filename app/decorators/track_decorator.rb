class TrackDecorator < Draper::Decorator
  delegate_all

  def to_hash
    hash = {}

    hash[:name] = model.name
    hash[:artist] = model.artist.name
    hash[:album] = model.album.name
    hash[:uts] = model.uts

    hash
  end
end
