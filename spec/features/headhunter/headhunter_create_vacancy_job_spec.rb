require 'rails_helper'

feature 'Headhunter create vacancy job' do
  
  scenario 'successfully' do
    user = create(:user, email: 'headhunter2@rspec.com', role: 'headhunter')
    login_as user, scope: :user

    visit root_path
    click_on 'Cadastrar vagas'

    fill_in 'Titulo', with: 'Jornalismo de BNN'
    fill_in 'Descrição', with: 'Criar materiar sobre BNN'
    fill_in 'Descrição das habilidades', with: 'Entrega rapida'
    fill_in 'Min', with: '1000'
    fill_in 'Max', with: '1800'
    select 'Estágio', from: 'Nivel da vaga'
    fill_in 'Data limite', with: '30-05-2020'
    fill_in 'Endereço', with: 'Rua das petalas N21'
    click_on 'Criar'

    expect(page).to have_content('Vaga de emprego')
    expect(page).to have_content('Jornalismo de BNN')
    expect(page).to have_content('Criar materiar sobre BNN')
    expect(page).to have_content('Entrega rapida')
    expect(page).to have_content('Entre R$ 1,000,00 a R$ 1,800,00')
    expect(page).to have_content('Estágio')
    expect(page).to have_content('Rua das petalas N21')
  end
end