require 'rails_helper'

feature 'Candidate view yours vacancy jobs' do
  
  scenario 'seccessfully' do
    user = create(:user, email: 'cadidate2@test.com')
    profile = create(:profile, user: user)
    user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
    vacuancy_job = create(:vacuancy_job, user: user2)
    job_application = create(:job_application, vacuancy_job: vacuancy_job, user: user)
    vacuancy_job2 = create(:vacuancy_job, title: 'Ubsoft web', description: 'Manutenção', user: user2)
    job_application2 = create(:job_application, vacuancy_job: vacuancy_job2, user: user)
    login_as user, scope: :user

    visit root_path
    click_on 'Minhas Inscrições'

    expect(page).to have_link(vacuancy_job.title, href: vacuancy_job_path(vacuancy_job))
    expect(page).to have_content(vacuancy_job.description)
    expect(page).to have_link(vacuancy_job2.title, href: vacuancy_job_path(vacuancy_job2))
    expect(page).to have_content(vacuancy_job2.description)
  end
end