class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não tem permissão para fazer esta ação."
    redirect_to(request.referrer || root_path)
  end

  def authenticate_headhunter
    authorize current_user, :user_headhunter?
  end

  def authenticate_candidate
    authorize current_user, :user_candidate?
  end

  def authenticate_cadidate_profile
    if policy(current_user).user_candidate? && current_user.profile.nil?
      flash[:alert] = "Você deve completar seu pefil primeiro."
      redirect_to(new_profile_path)
    end
  end
end
