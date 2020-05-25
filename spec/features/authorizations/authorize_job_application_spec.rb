require 'rails_helper'

feature 'Authorize job application' do

  context 'controller' do
    scenario 'new headhunter' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      vacuancy_job = create(:vacuancy_job, user: user2)
      login_as user2, scope: :user

      visit new_job_application_path
      

      expect(page).to have_content('Você não tem permissão para fazer esta ação.')
    end

    scenario 'new candidate' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      vacuancy_job = create(:vacuancy_job, user: user2)
      login_as user, scope: :user

      visit new_job_application_path
      

      expect(page).to have_content('Inscrição de trabalho')
    end
  end
end