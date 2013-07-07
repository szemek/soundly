class Tracks::UpdateController < ApplicationController
  def index
  end

  def create
    pages = params[:pages].to_i
    Tracks::Updater.run(pages)
    render :nothing => true, :status => 200
  end
end
