class AddCourseToAddInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :add_infos, :course, :string, default: ''
  end
end
