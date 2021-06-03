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

  def image_url(obj, image_name)
    polymorphic_url(obj.try(image_name)) if obj.try(image_name).attached?
  end

  def image(obj, image_name)
    url = image_url(obj, image_name)
    image_tag url unless url.nil?


  end
end
