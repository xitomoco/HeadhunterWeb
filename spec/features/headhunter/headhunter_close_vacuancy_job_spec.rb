require 'rails_helper'

feature 'Headhunter close vacuancy job' do

  scenario 'successfully' do
    user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
    vacuancy_job = create(:vacuancy_job, user: user2)
    login_as user2, scope: :user

    visit vacuancy_job_path(vacuancy_job)
    click_on 'Encerrar'
    
    expect(page).to have_content('Encerrada')
  end

  scenario 'candidate not view vacuancy job' do
    user = create(:user, email: 'cadidate2@test.com')
    profile = create(:profile, user: user)
    user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
    vacuancy_job = create(:vacuancy_job, user: user2, status: 1)
    login_as user, scope: :user

    visit vacuancy_jobs_path
    
    expect(page).not_to have_content(vacuancy_job.title)
  end
end