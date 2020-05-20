class JobApplicationsController < ApplicationController

  def new
    @vacuancy_job_id = (params[:vacuancy_job_id])
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new(params_job_application)
    @vacuancy_job = VacuancyJob.find(params[:job_application][:vacuancy_job_id])
    @job_application.user = current_user
    @job_application.vacuancy_job = @vacuancy_job

    if @job_application.save
      flash[:notice] = "Object successfully created"
      redirect_to @vacuancy_job
    else
      render 'new'
    end
  end

  private
  
  def params_job_application
    params.require(:job_application).permit(:comment, :vacuancy_job_id)
  end
end