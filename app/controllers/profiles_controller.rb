class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params_profile)
    set_user_id
    if @profile.save
      flash[:notice] = "Salvo com sucesso"
      redirect_to @profile
    else
      render 'new'
    end
  end

  def show
    set_profile
  end
  

  private

  def params_profile
    params.require(:profile).permit(:name, :social_name, :date_of_birth, :formations, :xp)
  end
  
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_user_id
    @profile.user = current_user
  end
end