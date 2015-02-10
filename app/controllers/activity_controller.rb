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

  def recent
    render json: recent_activity
  end

  private

  def recent_activity
    @recent_activity ||= Tracks::Activity.new(Track.recent).group_by_day
  end

  def all_activity
    @all_activity ||= Tracks::Activity.new(Track.all).group_by_day_and_hour
  end

  def punchcard
    @punchcard ||= Punchcard.new(all_activity).generate
  end
end
