class Track
  include Mongoid::Document

  embeds_one :artist
  embeds_one :album

  field :name, type: String
  field :mbid, type: String
  field :uts, type: Integer

  index({ mbid: 1 }, { unique: true, name: "mbid_index" })
  index({ uts: 1 }, { name: "uts_index" })

  def to_s
    self.name
  end

  def listened_at
    Time.at(uts)
  end

  def self.last_30_days
    timepoint = (Time.now - 29.days).beginning_of_day.to_i

    self.where(:uts.gte => timepoint)
  end
end
