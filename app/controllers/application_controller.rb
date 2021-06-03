class ApplicationController < ActionController::Base
  def default_url_options 
    if Rails.env.production?
      {host: "sphere-psy.ru"}
    else  
      {host: "localhost"}
    end
  end    

end
