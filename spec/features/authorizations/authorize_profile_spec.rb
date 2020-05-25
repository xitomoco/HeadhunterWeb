require 'rails_helper'

feature 'Authorize profile' do

  context 'controller' do
    scenario 'show' do
      user = create(:user, email: 'cadidate2@test.com')
      user2 = create(:user, email: 'cadidate3@test.com')
      profile = create(:profile, user: user2)
      login_as user, scope: :user

      visit profile_path(user2)

      expect(page).to have_content('Você deve completar seu pefil primeiro.')
    end
  end

  context 'views' do
    scenario 'show candidate' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      user2 = create(:user, email: 'cadidate3@test.com')
      profile = create(:profile, user: user2)
      login_as user, scope: :user

      visit profile_path(user2)

      expect(page).to have_content('Comentarios')
      expect(page).not_to have_button('Favoritar')
      expect(page).not_to have_content('Editar')
      expect(page).not_to have_button('Enviar')
    end

    scenario 'show master candidate' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      login_as user, scope: :user

      visit profile_path(user)

      expect(page).to have_content('Editar')
      expect(page).to have_content('Comentarios')
      expect(page).not_to have_button('Favoritar')
      expect(page).not_to have_button('Enviar')
    end

    scenario 'show headhunter' do
      user = create(:user, email: 'cadidate2@test.com')
      profile = create(:profile, user: user)
      user2 = create(:user, email: 'headhunter2@test.com', role: 'headhunter')
      login_as user2, scope: :user

      visit profile_path(user)

      expect(page).to have_button('Favoritar')
      expect(page).to have_content('Comentarios')
      expect(page).to have_button('Enviar')
      expect(page).not_to have_content('Editar')
    end
  end
end