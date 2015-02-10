require File.join(Rails.root, 'config/environment')

namespace :tracks do
  namespace :update do
    desc "Update last 200 scrobbles"
    task :recent do
      Tracks::Updater.run(1)
    end
  end
end
