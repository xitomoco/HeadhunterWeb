require 'rails_helper'

feature 'Headhunter favorite profile' do

  scenario 'successfully' do
    user = create(:user, email: 'cadidate2@test.com')
    profile = create(:profile, user: user)
    user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
    vacuancy_job = create(:vacuancy_job, user: user2)
    job_application = create(:job_application, vacuancy_job: vacuancy_job, user: user)
    login_as user2, scope: :user

    visit vacuancy_job_path(vacuancy_job)
    within("div.card-body") do
      click_on 'Perfil'
    end
    click_on 'Favoritar'

    expect(page).to have_content('Favoritado')
  end
end