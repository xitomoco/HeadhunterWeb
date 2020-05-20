class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.belongs_to :vacuancy_job, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
