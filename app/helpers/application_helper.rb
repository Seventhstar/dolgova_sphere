module ApplicationHelper
  def user_name
    current_user&.name
  end

  def google_map_key
    if Rails.env.production?
      ENV['GOOGLE_MAP_API_KEY']
    else
      Rails.application.config.gmaps.api_key
    end
  end
end
