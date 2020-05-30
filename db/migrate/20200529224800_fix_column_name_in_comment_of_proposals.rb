class FixColumnNameInCommentOfProposals < ActiveRecord::Migration[6.0]
  def change
    rename_column :comment_of_proposals, :commet, :comment
  end
end
