class Tracks::UpdateController < ApplicationController
  def create
    Tracks::Updater.run
  end
end
