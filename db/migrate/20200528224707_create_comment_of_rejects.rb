class CreateCommentOfRejects < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_of_rejects do |t|
      t.references :vacuancy_job, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
