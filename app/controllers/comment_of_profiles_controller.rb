class CommentOfProfilesController < ApplicationController

  def create
    @comment_of_profile = CommentOfProfile.new(params_comment_of_profile)
    @profile = Profile.find(params[:comment_of_profile][:profile_id])
    @comment_of_profile.user = current_user
    @comment_of_profile.profile = @profile
    @comment_of_profile.save!
    redirect_to @profile
  end
  
  private

  def params_comment_of_profile
    params.require(:comment_of_profile).permit(:comment, :profile_id)
  end
end