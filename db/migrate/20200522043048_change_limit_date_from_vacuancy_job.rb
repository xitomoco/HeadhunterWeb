class ChangeLimitDateFromVacuancyJob < ActiveRecord::Migration[6.0]
  def change
    change_column :vacuancy_jobs, :limit_date, :date
  end
end
