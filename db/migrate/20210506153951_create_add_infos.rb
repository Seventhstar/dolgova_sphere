class CreateAddInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :add_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.text :main
      t.text :about
      t.text :education
      t.string :logo_url
      t.string :photo_url

      t.timestamps
    end
  end
end
