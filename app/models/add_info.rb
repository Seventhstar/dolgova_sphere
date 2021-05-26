class AddInfo < ApplicationRecord
  belongs_to :user
  has_one_attached :main_image
  has_one_attached :about_image
  has_one_attached :study_image

end
