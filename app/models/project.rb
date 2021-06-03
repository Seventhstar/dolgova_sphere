class Project < ApplicationRecord
  belongs_to :course
  has_many :staff_projects, class_name: 'StaffProject', foreign_key: :project_id
  has_many :staffs, through: :staff_projects
  has_one_attached :image

  scope :active, -> { where(active: true).order(:id) }
end
