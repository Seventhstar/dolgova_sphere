ActiveAdmin.register AddInfo do
  permit_params :user_id, :main, :about, :education, :logo_url, :photo_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :about, :education, :logo_url, :photo_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
