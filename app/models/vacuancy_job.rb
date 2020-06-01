class VacuancyJob < ApplicationRecord
  belongs_to :user
  has_many :job_applications
  has_many :comment_of_rejects
  has_many :comment_of_proposals
  enum status: { active: 0, closed: 1 }
end
