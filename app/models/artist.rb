class Artist
  include Mongoid::Document

  has_many :tracks
  has_many :albums

  field :name, type: String
  field :mbid, type: String

  index({ mbid: 1 }, { unique: true, name: "mbid_index" })

  def to_s
    self.name
  end
end
