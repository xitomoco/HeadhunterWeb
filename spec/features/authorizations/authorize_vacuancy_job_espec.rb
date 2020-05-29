require 'rails_helper'

feature 'Authorize vacuancy job' do

  context 'controllers' do
    scenario 'new headhunter' do
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      login_as user2, scope: :user

      visit new_vacuancy_job_path

      expect(page).to have_content('Criar')
      expect(page).to have_content('Vaga de emprego')
    end

    scenario 'new candidate' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      login_as user, scope: :user

      visit new_vacuancy_job_path

      expect(page).to have_content('Você não tem permissão para fazer esta ação.')
    end

    scenario 'search_candidate headhunter' do
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      login_as user2, scope: :user

      visit search_candidate_vacuancy_jobs_path

      expect(page).to have_content('Você não tem permissão para fazer esta ação.')
    end

    scenario 'search_candidate candidate' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      login_as user, scope: :user

      visit search_candidate_vacuancy_jobs_path

      expect(page).to have_content('Minhas inscrições')
    end

    scenario 'search_headhunter headhunter' do
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      login_as user2, scope: :user

      visit search_headhunter_vacuancy_jobs_path

      expect(page).to have_content('Minhas vagas')
    end

    scenario 'search_headhunter candidate' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      login_as user, scope: :user

      visit search_headhunter_vacuancy_jobs_path

      expect(page).to have_content('Você não tem permissão para fazer esta ação.')
    end
  end

  context 'views' do
    scenario 'show candidate' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      vacuancy_job = create(:vacuancy_job, user: user2)
      login_as user, scope: :user

      visit vacuancy_job_path(vacuancy_job)

      expect(page).to have_content('Inscrever-se')
      expect(page).not_to have_content('Editar')
    end

    scenario 'show headhunter' do
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      vacuancy_job = create(:vacuancy_job, user: user2)
      user3 = create(:user, email: 'headhunter23@test.com', role: 'headhunter')
      login_as user3, scope: :user

      visit vacuancy_job_path(vacuancy_job)

      expect(page).not_to have_content('Inscrever-se')
      expect(page).not_to have_content('Editar')
    end

    scenario 'show master headhunter' do
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      vacuancy_job = create(:vacuancy_job, user: user2)
      login_as user2, scope: :user

      visit vacuancy_job_path(vacuancy_job)

      expect(page).not_to have_content('Inscrever-se')
      expect(page).to have_content('Editar')
    end
  end
end