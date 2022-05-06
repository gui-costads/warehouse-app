require 'rails_helper'

describe 'Usario visita tela inicial' do
  it 'e vê o nome do app'do
    #Arrange

    #Act
    visit root_path

    #Assert
    expect(page).to have_content('Galpões e Estoque')
  end

  it 'e vê os galpões cadastrados' do
    #Arrange
    #cadastrar 2 galpões: São Luis e São paulo
    Warehouse.create(name: 'São Luis', code: 'SLZ',  city: 'São Luis', area: 50_000, address: 'Av holandeses, numero 1000', cep: '65000-000', description: 'Galpão de São Luis')
    Warehouse.create(name: 'Rio', code: 'RIO',  city: 'Rio de Janeiro', area: 70_000, address: 'Av principal, numero 1000', cep: '31000-000', description: 'Galpão principal do Rio de Janeiro')

    #Act
    visit root_path
    #Assert
    expect(page).not_to have_content('Não existem galpões cadastrados')
    expect(page).to have_content('Nome: São Luis')
    expect(page).to have_content('Código: SLZ')
    expect(page).to have_content('Cidade: São Luis')
    expect(page).to have_content('Área: 50000 m²')
    
    expect(page).to have_content('Nome: Rio')
    expect(page).to have_content('Código: RIO')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('Área: 70000 m²')
  end

  it 'e não existem galpões cadastrados' do
    #Arrange

    #Act
    visit root_path

    #Assert
    expect(page).to have_content('Não existem galpões cadastrados')
  end
end