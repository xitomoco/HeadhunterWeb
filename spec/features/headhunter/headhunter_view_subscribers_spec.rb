require 'rails_helper'

feature 'Headnhunter view subscribers' do
  scenario 'successfully' do
    user = create(:user, email: 'cadidate2@test.com')
    profile = create(:profile, user: user)
    user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
    vacuancy_job = create(:vacuancy_job, user: user2)
    job_application = create(:job_application, vacuancy_job: vacuancy_job, user: user)
    login_as user2, scope: :user

    visit root_path
    click_on 'Minhas vagas'
    click_on vacuancy_job.title

    expect(page).to have_content(profile.name)
    expect(page).to have_content(job_application.comment)
  end
end