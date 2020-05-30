require 'rails_helper'

feature 'Headhunter proposal candidate' do
  
  scenario 'successfully' do
    user = create(:user, email: 'cadidate2@test.com')
    profile = create(:profile, user: user)
    user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
    vacuancy_job = create(:vacuancy_job, user: user2)
    job_application = create(:job_application, vacuancy_job: vacuancy_job, user: user)
    login_as user2, scope: :user

    visit vacuancy_job_path(vacuancy_job)
    click_on 'Enviar proposta'

    fill_in 'Comentário', with: 'Gostarioamos de você'
    click_on 'Enviar'

    expect(page).to have_content(profile.name)
    expect(page).to have_content('Pendente')
  end
end