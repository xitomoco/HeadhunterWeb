class CreateVacuancyJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :vacuancy_jobs do |t|
      t.string :title
      t.string :description
      t.string :ability_description
      t.string :initial_salary
      t.string :end_salary
      t.string :level
      t.string :limit_date
      t.string :addresse

      t.timestamps
    end
  end
end
