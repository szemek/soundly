class TrackSerializer < ActiveModel::Serializer
  attributes :name, :artist, :album, :uts

  def artist
    object.artist.name
  end

  def album
    object.album.name
  end
end
