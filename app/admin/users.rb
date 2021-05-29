ActiveAdmin.register User do
  menu parent: "Пользователи", label: 'Пользователи'
  permit_params :email, :name, :password, :password_confirmation, :is_admin,
                :is_staff, :actual, :avatar,
                sertificates: [], sertificate_attributes: [:_destroy]

  scope -> { 'Все' }, :all
  scope -> { 'Сотрудники' }, :staff
  scope -> { 'Админы' }, :admins
  scope -> { 'Клиенты' }, :clients

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

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
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
      f.input :actual, as: :boolean

      f.input :avatar, as: :file
      span image_tag(f.object.avatar) if f.object.avatar.present?

      f.input :sertificates, as: :file, input_html: {multiple: true}

      span class: "admin_images" do
        f.object.sertificates.each do |img|
          span class: "admin_image_preview" do
            span image_tag(img)
            a "Delete", href: delete_avatar_user_path(img.id), "data-method": :delete, "data-confirm": "Are you sure?"
          end
        end
      end
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
