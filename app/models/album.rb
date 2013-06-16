class Album
  include Mongoid::Document

  embedded_in :track

  field :name, type: String
  field :mbid, type: String

  index({ mbid: 1 }, { unique: true, name: "mbid_index" })

  def to_s
    self.name
  end
end
