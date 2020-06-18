class CommentOfRejectsController < ApplicationController
  before_action :authenticate_headhunter

  def new
    @vacuancy_job = VacuancyJob.find(params[:vacuancy_job_id])
    @user_id = params[:user_id]
    @comment_of_reject = CommentOfReject.new
  end

  def create
    set_create
    if @comment_of_reject.save
      @job_application = JobApplication.where({ vacuancy_job_id: @vacuancy_job.id,
                                                user_id: @user.id })
      if @job_application[0].destroy
        flash[:notice] = 'Rejeitado com sucesso'
        redirect_to @comment_of_reject.vacuancy_job
      end
    else
      render 'new'
    end
  end

  private

  def params_comment_of_reject
    params.require(:comment_of_reject).permit(:vacuancy_job_id,
                                              :user_id, :comment)
  end

  def set_create
    @vacuancy_job = VacuancyJob.find(params[:vacuancy_job_id])
    @user = User.find(params[:comment_of_reject][:user_id])
    @comment_of_reject = CommentOfReject.new(params_comment_of_reject)
    @comment_of_reject.vacuancy_job = @vacuancy_job
    @comment_of_reject.user = @user
  end
end
