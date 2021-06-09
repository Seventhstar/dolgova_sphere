ActiveAdmin.register Course do
  menu parent: "Направления", label: 'Направления'

  permit_params :name, :order, :name_for_price, :description, :duration, :icon, :staff_ids => []

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Направление" do
      f.input :name
      f.input :order
      f.input :name_for_price
      f.input :description, as: :froala_editor
      f.input :duration

      f.input :icon, as: :file
      span image_tag(f.object.icon), alt: f.object.icon.name if f.object.icon.present?

      f.input :staffs, label: 'Кто ведет', as: :check_boxes, foreign_key: :user_id,
              collection: User.staff.map { |s| [s.name, s.id] }
    end
    actions
  end

end
