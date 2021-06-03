class Course < ApplicationRecord
  has_many :course_staffs, class_name: 'CourseStaff', foreign_key: :course_id
  has_many :staffs, through: :course_staffs
  has_one_attached :icon
  include Rails.application.routes.url_helpers

  def description_html
    ActionController::Base.helpers.simple_format(self&.description)
  end

  def icon_url
    url_for(self.icon) if self.icon.attached?
  end

end
