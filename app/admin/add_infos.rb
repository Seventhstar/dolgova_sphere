ActiveAdmin.register AddInfo do
  menu parent: "Пользователи", label: 'Доп. информация'
  permit_params :user_id, :course, :main, :about, :education, :logo_url, :photo_url, :main_image, :about_image, :study_image

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


  # f.input :avatar, as: :file
  # span image_tag(f.object.avatar) if f.object.avatar.present?


  form do |f|
    f.inputs do
      f.input :user_id, label: 'Сотрудник', as: :select, collection: User.staff
      f.input :course, label: 'Основные направления'
      f.input :main, label: 'С чем я работаю'

      f.input :main_image, as: :file
      span image_tag(f.object.main_image) if f.object.main_image.present?

      f.input :about, label: 'Обо мне'
      
      f.input :about_image, as: :file
      span image_tag(f.object.about_image) if f.object.about_image.present?

      f.input :education, label: 'Образование'

      f.input :study_image, as: :file
      span image_tag(f.object.study_image) if f.object.study_image.present?

    end
    actions
  end
      # or
  #
  # permit_params do
  #   permitted = [:user_id, :about, :education, :logo_url, :photo_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

