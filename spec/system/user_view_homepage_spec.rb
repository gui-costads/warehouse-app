require 'rails_helper'

describe 'Usario visita tela inicial' do
  it 'e vê o nome do app'do
    #Arrange

    #Act
    visit('/')

    #Assert
    expect(page).to have_content('Galpões e Estoque')
  end
end