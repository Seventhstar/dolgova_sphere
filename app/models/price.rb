class Price < ApplicationRecord
  belongs_to :course
  belongs_to :tarif
  belongs_to :staff, class_name: 'User', foreign_key: :staff_id
end
