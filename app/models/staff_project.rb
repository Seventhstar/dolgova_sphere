class StaffProject < ApplicationRecord
  belongs_to :project
  belongs_to :staff, class_name: 'User', foreign_key: :staff_id
end
