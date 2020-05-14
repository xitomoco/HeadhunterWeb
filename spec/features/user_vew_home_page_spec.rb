require 'rails_helper'

feature 'User view home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Headhunter Web')
    expect(page).to have_content('Seja bem-vindo')
  end
end