class AddSocialToContact < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :social, :boolean, default: false
    add_column :contacts, :link, :string
  end
end
