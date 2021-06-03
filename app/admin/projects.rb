ActiveAdmin.register Project do
  menu parent: "Направления", label: 'Проекты'
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :course_id, :name, :image, :active, :overview, :description, :staffs_ids => []

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs "Проект" do
      f.input :name
      f.input :active, as: :boolean
      f.input :course
      f.input :overview
      f.input :description

      f.input :image, as: :file
      span image_tag(f.object.image), alt: f.object.image.name if f.object.image.present?

      f.input :staffs, label: 'Кто ведет', as: :check_boxes, foreign_key: :user_id, 
                collection: User.staff.map{ |s| [s.name, s.id] }

    end
   actions
   end

  #
  # or
  #
  # permit_params do
  #   permitted = [:course_id, :name, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
