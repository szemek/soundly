class ActivityController < ApplicationController
  def show
    respond_to do |format|
      format.html do
        @data = activity
        @svg = punchcard
      end
      format.svg do
        response.headers["Content-Type"] = 'image/svg+xml'
        render inline: punchcard
      end
    end
  end

  private

  def activity
    @activity ||= Tracks::Activity.new.gather
  end

  def punchcard
    @punchcard ||= PunchcardGenerator.new(activity).generate
  end
end
