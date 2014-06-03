module Enumerable
  def count_by(&block)
    Hash[group_by(&block).map { |key,vals| [key, vals.size] }]
  end
end

class Tracks::Activity
  attr_accessor :tracks

  def initialize(tracks)
    @tracks = tracks
  end

  def group_by_day
    start = (Time.now - 29.days).beginning_of_day.to_i
    stop = Time.now.beginning_of_day.to_i

    datetimes = tracks.pluck(:uts).map{|e| Time.at(e).beginning_of_day}

    (start..stop).step(1.day).map{|timepoint| datetimes.count(Time.at(timepoint).beginning_of_day)}
  end

  def group_by_day_and_hour
    datetimes = tracks.pluck(:uts).map{|e| Time.at(e)}

    by_day = datetimes.group_by{|e| e.strftime('%u').to_i - 1}
    by_day_and_hour = {}

    by_day.each do |day, times|
      by_day_and_hour[day] = times.count_by{|e| e.hour}
    end

    return by_day_and_hour
  end
end
