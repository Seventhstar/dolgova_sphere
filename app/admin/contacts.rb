ActiveAdmin.register Contact do
  menu parent: "Настройки", label: 'Контакты'
  permit_params :name, :value, :icon, :social, :link

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Направление" do
      f.input :name
      f.input :value
      f.input :link
      f.input :social, as: :boolean

      f.input :icon, as: :file
      span image_tag(f.object.icon), alt: f.object.icon.name if f.object.icon.present?

    end
    actions
  end
 
end
