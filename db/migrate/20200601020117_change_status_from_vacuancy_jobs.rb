class ChangeStatusFromVacuancyJobs < ActiveRecord::Migration[6.0]
  def change
    change_column :vacuancy_jobs, :status, :integer, default: 0
  end
end
