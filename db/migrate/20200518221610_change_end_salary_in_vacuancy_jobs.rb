class ChangeEndSalaryInVacuancyJobs < ActiveRecord::Migration[6.0]
  def change
    change_column :vacuancy_jobs, :end_salary, :float
  end
end
