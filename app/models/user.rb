class User < ApplicationRecord
  enum role: { candidate: 0, headhunter: 1, admin: 10 }
  has_one :profile
  has_many :vacuancy_jobs
  has_many :job_applications
  has_many :comment_of_profiles
  has_many :favorites
  has_many :comment_of_rejects
  has_many :comment_of_proposal

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
