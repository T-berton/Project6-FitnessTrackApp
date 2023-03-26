class Activity < ApplicationRecord
    has_many :activity_users 
	has_many :user, through: :activity_users
end
