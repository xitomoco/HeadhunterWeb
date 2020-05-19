class AddUserToVacuancyJob < ActiveRecord::Migration[6.0]
  def change
    add_reference :vacuancy_jobs, :user, foreign_key: true
  end
end
