class ActivityController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.svg do
        response.headers["Content-Type"] = 'image/svg+xml'
        render inline: punchcard
      end
    end
  end

  private

  def activity
    Tracks::Activity.new.gather
  end

  def punchcard
    PunchcardGenerator.new(activity).generate
  end
end
