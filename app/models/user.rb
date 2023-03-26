class User < ApplicationRecord
  has_many :activity_users 
	has_many :activities, through: :activity_users
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
