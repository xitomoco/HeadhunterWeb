class VacuancyJob < ApplicationRecord
  belongs_to :user
  has_many :job_applications
  has_many :comment_of_rejects
end
