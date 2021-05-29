class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.references :course, null: false, foreign_key: true
      t.integer :staff_id, null: false
      t.references :tarif, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
