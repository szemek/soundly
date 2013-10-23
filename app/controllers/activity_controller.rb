class ActivityController < ApplicationController
  def show
    activity = Tracks::Activity.new
    @data = activity.gather
    punchcard = Builder.new
    @svg = punchcard.generate(@data)
  end
end
