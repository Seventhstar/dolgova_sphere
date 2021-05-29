class AddForPriceToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :name_for_price, :string
    add_column :courses, :order, :integer
  end
end
