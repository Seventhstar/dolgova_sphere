ActiveAdmin.register Project do
  menu parent: "Направления", label: 'Проекты'
  permit_params :course_id, :name, :image, :active, :overview, :description, :staff_ids => []

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs "Проект" do
      f.input :name, label: 'Заголовок'
      f.input :active, as: :boolean, label: 'Активный'
      f.input :course, label: 'Входит в проект'
      f.input :overview, as: :quill_editor, input_html: {data: def_quill_props}, label: "Краткое содержание"
      f.input :description, as: :quill_editor, input_html: {data: def_quill_props}, label: "Полное описание"

      f.input :image, as: :file
      span image_tag(f.object.image), alt: f.object.image.name if f.object.image.present?

      f.input :staffs, label: 'Кто ведет', as: :check_boxes, foreign_key: :user_id,
              collection: User.staff.map { |s| [s.name, s.id] }
    end
    actions
  end

end
