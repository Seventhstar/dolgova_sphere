ActiveAdmin.register Course do
  menu parent: "Направления", label: 'Направления'

  permit_params :name, :name_for_price, :description, :duration, :staff_ids => []

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Направление" do
      f.input :name
      f.input :name_for_price
      f.input :description 
      f.input :duration

      f.input :staffs, label: 'Кто ведет', as: :check_boxes, foreign_key: :user_id, 
                collection: User.staff.map{ |s| [s.name, s.id] }
    end
    actions
  end
  
end
