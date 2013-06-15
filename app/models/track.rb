class Track
  include Mongoid::Document

  belongs_to :artist
  belongs_to :album

  embeds_one :artist
  embeds_one :album

  field :name, type: String
  field :mbid, type: String

  index({ mbid: 1 }, { unique: true, name: "mbid_index" })
end
