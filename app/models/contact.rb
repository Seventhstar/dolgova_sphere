class Contact < ApplicationRecord
  has_one_attached :icon

  scope :social, -> { where(social: true).order(:id) }
  scope :usual, -> { where(social: false).order(:id) }
end
