class JobApplication < ApplicationRecord
  belongs_to :vacuancy_job
  belongs_to :user
end
