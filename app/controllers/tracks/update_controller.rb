class Tracks::UpdateController < ApplicationController
  def index
  end

  def create
    Tracks::Updater.run
    render :nothing => true, :status => 200
  end
end
