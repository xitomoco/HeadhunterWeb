class CommentOfProposalsController < ApplicationController
  before_action :authenticate_headhunter

  def new
    @vacuancy_job = VacuancyJob.find(params[:vacuancy_job_id])
    @user_id = (params[:user_id])
    @comment_of_proposal = CommentOfProposal.new
  end

  def create
    @vacuancy_job = VacuancyJob.find(params[:vacuancy_job_id])
    @user = User.find(params[:comment_of_proposal][:user_id])
    @comment_of_proposal = CommentOfProposal.new(params_comment_of_proposal)
    @comment_of_proposal.vacuancy_job = @vacuancy_job
    @comment_of_proposal.user = @user
    if @comment_of_proposal.save
      flash[:notice] = 'Proposta enviada com sucesso'
      redirect_to @comment_of_proposal.vacuancy_job
    else
      render 'new'
    end
  end

  private
  
  def params_comment_of_proposal
    params.require(:comment_of_proposal).permit(:vacuancy_job_id, :user_id, :comment)
  end
end