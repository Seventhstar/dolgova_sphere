class CreateTarifs < ActiveRecord::Migration[6.1]
  def change
    create_table :tarifs do |t|
      t.string :name

      t.timestamps
    end
  end
end
