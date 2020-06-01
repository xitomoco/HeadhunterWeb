class AddStatusToVacuancyJob < ActiveRecord::Migration[6.0]
  def change
    add_column :vacuancy_jobs, :status, :integer
  end
end
