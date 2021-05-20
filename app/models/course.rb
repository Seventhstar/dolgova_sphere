class Course < ApplicationRecord
  has_many :course_staffs, class_name: 'CourseStaff', foreign_key: :course_id
  has_many :staffs, through: :course_staffs

  def description_html
    ActionController::Base.helpers.simple_format(self&.description)
  end
end
