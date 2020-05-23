class CreateCommentOfProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_of_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
