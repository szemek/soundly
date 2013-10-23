module Enumerable
  def count_by(&block)
    Hash[group_by(&block).map { |key,vals| [key, vals.size] }]
  end
end

class Tracks::Activity
  def gather
    datetimes = Track.pluck(:uts).map{|e| Time.at(e)}

    by_day = datetimes.group_by{|e| e.strftime('%u').to_i - 1}
    by_day_and_hour = {}

    by_day.each do |day, times|
      by_day_and_hour[day] = times.count_by{|e| e.hour}
    end

    return by_day_and_hour
  end
end
