require 'rails_helper'

feature 'Candidate subscriber' do

  scenario 'successfully' do
    user = create(:user, email: 'cadidate2@test.com')
    profile = create(:profile, user: user)
    user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
    vacuancy_job = create(:vacuancy_job, user: user2)
    login_as user, scope: :user

    visit root_path
    click_on 'Vagas de emprego'
    click_on 'Jornalismo de BNN'
    click_on 'Inscrever-se'

    fill_in 'Comentário', with: 'Já trabalhei na area por 75anos'
    click_on 'Registrar'

    expect(page).to have_content('Vaga de emprego')
    expect(page).to have_content(vacuancy_job.title)
    expect(page).to have_content(profile.name)
    expect(page).to have_content('Já trabalhei na area por 75anos')
    expect(page).to have_content(profile.formations)
  end
end