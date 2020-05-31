class MessagesController < ApplicationController

  def index
    @profile = Profile.find(params[:profile_id])
    @comment_of_proposals = CommentOfProposal.where({user_id: "#{current_user.id}"})
    @comment_of_rejects = CommentOfReject.where({user_id: "#{current_user.id}"})
  end

  def message_proposals
    @comment_of_proposals = CommentOfProposal.where({user_id: "#{current_user.id}"})
  end

  def message_rejects
    @comment_of_rejects = CommentOfReject.where({user_id: "#{current_user.id}"})
  end
end