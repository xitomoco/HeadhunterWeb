require 'rails_helper'

feature 'Headhunter reject cadidate' do
  
  scenario 'successfully' do
    user = create(:user, email: 'cadidate2@test.com')
    profile = create(:profile, user: user)
    user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
    vacuancy_job = create(:vacuancy_job, user: user2)
    job_application = create(:job_application, vacuancy_job: vacuancy_job, user: user)
    login_as user2, scope: :user

    visit vacuancy_job_path(vacuancy_job)
    save_page
    click_on 'Rejeitar'

    fill_in 'Comentário', with: 'Perfil não agrada a empresa'
    click_on 'Enviar'

    expect(page).not_to have_content(profile.name)
  end
end