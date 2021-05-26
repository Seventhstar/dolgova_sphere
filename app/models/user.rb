class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Rails.application.routes.url_helpers

  has_one :add_info
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  scope :staff, ->{where(is_staff: true).order(:id)}
  scope :admins, ->{where(is_admin: true).order(:id)}
  scope :clients, ->{where({is_admin: false, is_staff: false}).order(:id)}

  has_one_attached :avatar
  has_many_attached :sertificates

  def sertificate_attributes=(attributes)
    sertificate.clear if has_destroy_flag?(attributes) && !sertificate.dirty?
  end

  def image_url(name)
    self&.add_info.try(name) if self&.add_info.try(name).present?
  end

  def course
     self&.add_info&.course
  end

  def main
    ActionController::Base.helpers.simple_format(self&.add_info&.main)
  end

  def about
    ActionController::Base.helpers.simple_format(self&.add_info&.about)
  end

  def education
    ActionController::Base.helpers.simple_format(self&.add_info&.education)
  end
end
