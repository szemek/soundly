class Track
  include Mongoid::Document

  belongs_to :artist
  belongs_to :album

  field :name, type: String
  field :mbid, type: String
  field :uts, type: Integer

  index({ mbid: 1 }, { unique: true, name: "mbid_index" })
  index({ uts: 1 }, { name: "uts_index" })

  def to_s
    self.name
  end
end
