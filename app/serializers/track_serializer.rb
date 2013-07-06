class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :album, :uts

  def id
    object.id.to_s
  end

  def artist
    object.artist.name
  end

  def album
    object.album.name
  end
end
