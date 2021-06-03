class AddOverViewToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :overview, :text
    add_column :projects, :active, :boolean, default: true
  end
end
