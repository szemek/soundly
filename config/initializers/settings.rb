class Settings < Settingslogic
  source "#{Rails.root}/config/settings/#{Rails.env}.yml"
  namespace Rails.env
  suppress_errors Rails.env.production?
end
