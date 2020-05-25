class VacuancyJobsController < ApplicationController
  before_action :authenticate_cadidate_profile, only: [:index, :search_candidate]
  before_action :authenticate_headhunter, only: [:new, :create, :search_headhunter]
  before_action :authenticate_candidate, only: [:search_candidate]

  def index
    @vacuancy_jobs = VacuancyJob.all
  end
  

  def new
    @vacuancy_job = VacuancyJob.new
    set_level_selection
  end

  def create
    @vacuancy_job = VacuancyJob.new(params_vacuancy_job)
    set_user_id
    if @vacuancy_job.save
      flash[:notice] = 'Vaga criada com sucesso'
      redirect_to @vacuancy_job
    else
      render 'new'
    end
  end

  def show
    set_job_applications
    set_vacuancy_job
    set_level_selection
  end

  def search_candidate
    @job_applications = JobApplication.where({user_id: "#{current_user.id}"})
  end

  def search_headhunter
    @vacuancy_jobs = VacuancyJob.where({user_id: "#{current_user.id}"})
  end

  private
  
  def params_vacuancy_job
    params.require(:vacuancy_job).permit(:title, :description, :ability_description, :initial_salary, 
                                         :end_salary, :level, :limit_date, :addresse)
  end

  def set_user_id
    @vacuancy_job.user = current_user
  end

  def set_level_selection
    @level_selection = [['Estágio', 0], ['Junior', 1], ['Pleno', 2], ['Sênior', 3], ['Especialista', 4], 
                        ['Diretor', 5]]
  end

  def set_vacuancy_job
    @vacuancy_job = VacuancyJob.find(params[:id])
  end

  def set_job_applications
    @job_applications = JobApplication.where("vacuancy_job_id = #{params[:id]}")
  end

  def authenticate_headhunter
    authorize current_user, :user_headhunter?
  end

  def authenticate_candidate
    authorize current_user, :user_candidate?
  end
end