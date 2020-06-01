require 'rails_helper'

feature 'Candidate view profile' do
  
  context 'candidate' do
    scenario 'successfully' do
      profile = create(:profile)
      user = create(:user, email: 'candidate2@rspec.com')
      login_as user, scope: :user

      visit root_path
      click_on 'Perfil'

      fill_in 'Nome', with: profile.name
      fill_in 'Nome social', with: profile.social_name
      fill_in 'Data de aniversário', with: profile.date_of_birth
      fill_in 'Formações', with: profile.formations
      fill_in 'Experiancia', with: profile.xp
      click_on 'Salvar'

      expect(page).to have_content('Perfil')
      expect(page).to have_content(profile.name)
      expect(page).to have_content(profile.social_name)
      expect(page).to have_content("05/05/1995")
      expect(page).to have_content(profile.formations)
      expect(page).to have_content(profile.xp)
      expect(page).to have_content('Editar')
      expect(page).not_to have_content('Salvar')
    end

    scenario 'second time' do
      user = create(:user, email: 'candidate2@rspec.com')
      profile = create(:profile, user: user)
      login_as user, scope: :user

      visit root_path
      click_on 'Perfil'

      expect(page).to have_content('Perfil')
      expect(page).to have_content(profile.name)
      expect(page).to have_content(profile.social_name)
      expect(page).to have_content("05/05/1995")
      expect(page).to have_content(profile.formations)
      expect(page).to have_content(profile.xp)
      expect(page).to have_content('Editar')
      expect(page).not_to have_content('Salvar')
    end
  end
end