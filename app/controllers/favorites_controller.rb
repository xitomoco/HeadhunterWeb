class FavoritesController < ApplicationController
  before_action :authenticate_headhunter

  def create
    @favorite = Favorite.new(params_favorite)
    @profile = Profile.find(params[:favorite][:profile_id])
    @favorite.user = current_user
    @favorite.profile = @profile
    @favorite.save!
    flash[:notice] = 'Favoritado com sucesso'
    redirect_to @profile
  end

  private

  def params_favorite
    params.require(:favorite).permit(:profile_id)
  end  
end