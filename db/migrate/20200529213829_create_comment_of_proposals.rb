class CreateCommentOfProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_of_proposals do |t|
      t.references :vacuancy_job, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :commet
      t.integer :status

      t.timestamps
    end
  end
end
