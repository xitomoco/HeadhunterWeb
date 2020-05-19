class VacuancyJobsController < ApplicationController

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
      flash[:notice] = "Object successfully created"
      redirect_to @vacuancy_job
    else
      render 'new'
    end
  end

  def show
    set_vacuancy_job
    set_level_selection
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
end