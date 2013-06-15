class Album
  include Mongoid::Document

  belongs_to :artist

  has_many :tracks

  field :name, type: String
  field :mbid, type: String

  index({ mbid: 1 }, { unique: true, name: "mbid_index" })
end
