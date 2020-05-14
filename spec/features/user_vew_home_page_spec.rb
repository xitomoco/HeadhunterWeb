require 'rails_helper'

feature 'User view home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Headhunter Web')
    expect(page).to have_content('Seja bem-vindo')
    expect(page).to have_link('Inicio', href: root_path)
    expect(page).to have_link('Entrar', href: new_user_session_path)
    expect(page).to have_link('Cadastrar-me', href: new_user_registration_path)
  end
end