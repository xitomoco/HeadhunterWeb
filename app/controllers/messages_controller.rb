class MessagesController < ApplicationController
  before_action :authenticate_cadidate_profile

  def index
    @profile = Profile.find(params[:profile_id])
    @comment_of_proposals = CommentOfProposal.where({user_id: "#{current_user.id}"})
    @comment_of_rejects = CommentOfReject.where({user_id: "#{current_user.id}"})
  end

  def message_proposals
    @profile = Profile.find(params[:profile_id])
    @comment_of_proposals = CommentOfProposal.where({user_id: "#{current_user.id}"})
  end

  def message_rejects
    @profile = Profile.find(params[:profile_id])
    @comment_of_rejects = CommentOfReject.where({user_id: "#{current_user.id}"})
  end
end