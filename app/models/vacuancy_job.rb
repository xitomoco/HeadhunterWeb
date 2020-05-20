class VacuancyJob < ApplicationRecord
  belongs_to :user
  has_many :job_applications
  #has_many :users, through: :job_applications
end
