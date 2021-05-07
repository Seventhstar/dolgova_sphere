class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :add_info
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end
