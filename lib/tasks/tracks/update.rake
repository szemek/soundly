require 'rest-client'

namespace :tracks do
  desc "Update last 200 scrobbles"
  task :update do
    # there are 200 tracks per page
    RestClient.post 'http://soundly.herokuapp.com/tracks/update', {pages: 1}
  end
end
