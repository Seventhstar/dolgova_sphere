class CreateCourseStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :course_staffs do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
