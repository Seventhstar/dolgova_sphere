class AddActualToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :actual, :boolean
  end
end
