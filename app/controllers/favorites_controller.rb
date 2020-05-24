class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(params_favorite)
    @profile = Profile.find(params[:favorite][:profile_id])
    @favorite.user = current_user
    @favorite.profile = @profile
    @favorite.save!
    redirect_to @profile
  end

  private

  def params_favorite
    params.require(:favorite).permit(:profile_id)
  end  
end