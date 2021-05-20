ActiveAdmin.register AddInfo do
  menu parent: "Пользователи", label: 'Доп. информация'
  permit_params :user_id, :course, :main, :about, :education, :logo_url, :photo_url

  index do
    selectable_column
    id_column
    column :user
    column :course do |info|
       info.course[0..10]
    end
    column :main do |info|
       info.main[0..10]
    end
    column :about do |info|
       info.about[0..10]
    end  
    column :education do |info|
       info.education[0..10]
    end  
    actions
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :about, :education, :logo_url, :photo_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

