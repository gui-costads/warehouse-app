require 'rails_helper'

describe 'Usuário edita galpão registrado' do
  it 'a partir da pagina detalhes' do
		#Arrange
		Warehouse.create(name: 'São Luis', code: 'SLZ',  city: 'São Luis', area: 50_000, address: 'Av holandeses, numero 1000', postal_code: '65000-000', description: 'Galpão de São Luis')

		#Act
		visit root_path
		click_on 'São Luis'
		click_on 'Editar'
		
		#Assert
		expect(page).to have_field('Nome', with: 'São Luis')
		expect(page).to have_field('Código', with: 'SLZ')
		expect(page).to have_field('Cidade', with: 'São Luis')	
		expect(page).to have_field('Área', with: '50000')	
		expect(page).to have_field('Endereço', with:'Av holandeses, numero 1000')	
		expect(page).to have_field('Cep', with: '65000-000')	
		expect(page).to have_field('Descrição', with: 'Galpão de São Luis')	
	end

	it 'com  sucesso' do
		#Arrange
		Warehouse.create(name: 'São Luis', code: 'SLZ',  city: 'São Luis', area: 50_000, address: 'Av holandeses, numero 1000', postal_code: '65000-000', description: 'Galpão de São Luis')

		#Act
		visit root_path
		click_on 'São Luis'
		click_on 'Editar'
		fill_in 'Nome', with: 'São Luís'
		fill_in 'Código', with: 'slz'
		fill_in 'Área', with: '30000'
		click_on 'Salvar'

		#Assert
		expect(page).to have_content('Galpão atualizdo com sucesso!')
		expect(page).to have_content('Nome: São Luís')
		expect(page).to have_content('Código: slz')
		expect(page).to have_content('Cidade: São Luis')	
		expect(page).to have_content('Área: 30000')	
		expect(page).to have_content('Endereço: Av holandeses, numero 1000')	
		expect(page).to have_content('Cep: 65000-000')	
		expect(page).to have_content('Galpão de São Luis')	
	end

	it 'sem sucesso e mantém os campos preenchidos' do
		#Arrange
		Warehouse.create(name: 'São Luis', code: 'SLZ',  city: 'São Luis', area: 50_000, address: 'Av holandeses, numero 1000', postal_code: '65000-000', description: 'Galpão de São Luis')

		#Act
		visit root_path
		click_on 'São Luis'
		click_on 'Editar'
		fill_in 'Nome', with: ''
		fill_in 'Código', with: ''
		fill_in 'Área', with: ''
		click_on 'Salvar'
		
		#Assert
		expect(page).to have_content('Não foi possível atualizar!')
		expect(page).to have_content 'Nome não pode ficar em branco'
		expect(page).to have_content 'Código não pode ficar em branco'
		expect(page).to have_content 'Área não pode ficar em branco'
	end
end