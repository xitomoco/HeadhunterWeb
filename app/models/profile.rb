class Profile < ApplicationRecord
  belongs_to :user
  has_many :comment_of_profiles
end
