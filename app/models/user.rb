class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :add_info
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  scope :staff, ->{where(is_staff: true).order(:id)}

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
