class ChangeStatusInCommentOfProposals < ActiveRecord::Migration[6.0]
  def change
    change_column :comment_of_proposals, :status, :integer, default: 0
  end
end
