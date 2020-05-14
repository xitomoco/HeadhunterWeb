require 'rails_helper'

feature 'Candidate register' do
  
  scenario 'succesfully' do
    visit root_path
    click_on 'Cadastrar-me'

    fill_in 'Email', with: 'candidate1@email.com'
    fill_in 'Senha', with: '1234567'
    fill_in 'Confirmação de sehna', with: '1234567'
    within('div.actions') do
      click_on 'Cadastrar-me'
    end

    expect(page).to have_content('Headhunter Web')
    expect(page).to have_content('Seja bem-vindo')
    expect(page).to have_link('Sair', href: destroy_user_session_path)
    expect(page).to have_link('Inicio', href: root_path)
    expect(page).not_to have_link('Entrar', href: new_user_session_path)
    expect(page).not_to have_link('Cadastrar-me', href: new_user_registration_path)
  end

  scenario 'without informations' do
    visit new_user_registration_path

    within('div.actions') do
      click_on 'Cadastrar-me'
    end

    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('Senha não pode ficar em branco')
    expect(page).not_to have_content('Headhunter Web')
    expect(page).not_to have_content('Seja bem-vindo')
  end
end