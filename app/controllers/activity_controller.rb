class ActivityController < ApplicationController
  def show
    activity = Tracks::Activity.new
    @data = activity.gather
  end
end
