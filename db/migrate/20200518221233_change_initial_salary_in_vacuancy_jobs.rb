class ChangeInitialSalaryInVacuancyJobs < ActiveRecord::Migration[6.0]
  def change
    change_column :vacuancy_jobs, :initial_salary, :float
  end
end
