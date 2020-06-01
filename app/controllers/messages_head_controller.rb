class MessagesHeadController <ApplicationController
  before_action :authenticate_headhunter

  def index
    @user = current_user
    @vacuancy_jobs = @user.vacuancy_jobs
    set_message
  end

  private

  def set_message
    @msg = true
    if @vacuancy_jobs[0].comment_of_proposals.empty?
      @msg = false
    end
  end
end