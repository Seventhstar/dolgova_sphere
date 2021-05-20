class CourseStaff < ApplicationRecord
  belongs_to :course
  belongs_to :staff, class_name: 'User', foreign_key: :user_id
end
