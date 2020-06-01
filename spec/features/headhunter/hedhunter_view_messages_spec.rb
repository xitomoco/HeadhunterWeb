require 'rails_helper'

feature 'Headhunter view messages' do
  
  context 'index' do
    scenario 'reject' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      vacuancy_job = create(:vacuancy_job, user: user2)
      job_application = create(:job_application, vacuancy_job: vacuancy_job, user: user)
      comment_of_reject = create(:comment_of_reject, vacuancy_job: vacuancy_job, user: user)
      login_as user2, scope: :user

      visit root_path
      click_on 'Mensagens'

      expect(page).to have_content(vacuancy_job.title)
      expect(page).to have_content(comment_of_reject.comment)
    end

    scenario 'proposal' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      vacuancy_job = create(:vacuancy_job, user: user2)
      job_application = create(:job_application, vacuancy_job: vacuancy_job, user: user)
      comment_of_proposal = create(:comment_of_proposal, vacuancy_job: vacuancy_job, user: user)
      login_as user2, scope: :user

      visit root_path
      click_on 'Mensagens'

      expect(page).to have_content(vacuancy_job.title)
      expect(page).to have_content('Pendente')
    end
  end
end