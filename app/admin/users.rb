ActiveAdmin.register User do
  permit_params :email, :name, :password, :password_confirmation, :is_admin, :is_staff

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :is_admin
    column :is_staff
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :is_staff, as: :boolean
      f.input :is_admin, as: :boolean
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
    end
    f.actions
  end

end
