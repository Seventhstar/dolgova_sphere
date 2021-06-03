class CreateStaffProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :staff_projects do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :staff_id

      t.timestamps
    end
  end
end
