class ChangeLevelInVacuancyJobs < ActiveRecord::Migration[6.0]
  def change
    change_column :vacuancy_jobs, :level, :int
  end
end
