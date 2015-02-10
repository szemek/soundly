class ActivityController < ApplicationController
  def all
    respond_to do |format|
      format.html do
        @data = all_activity
        @svg = punchcard
      end
      format.svg do
        render inline: punchcard, content_type: Mime::SVG
      end
    end
  end

  def last_30_days
    render json: last_30_days_activity
  end

  private

  def last_30_days_activity
    @last_30_days_activity ||= Tracks::Activity.new(Track.last_30_days).group_by_day
  end

  def all_activity
    @all_activity ||= Tracks::Activity.new(Track.all).group_by_day_and_hour
  end

  def punchcard
    @punchcard ||= Punchcard.new(all_activity).generate
  end
end
