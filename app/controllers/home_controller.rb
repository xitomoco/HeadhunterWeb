class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if user_signed_in?
      if policy(current_user).user_candidate? && current_user.profile.present?
        @profile = Profile.find(current_user.id)
      else
        @user = current_user
      end
    end
  end
end