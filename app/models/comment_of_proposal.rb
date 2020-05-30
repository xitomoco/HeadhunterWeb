class CommentOfProposal < ApplicationRecord
  enum status: { pending: 0, rejected: 1, accepted: 2 }
  belongs_to :vacuancy_job
  belongs_to :user
end
