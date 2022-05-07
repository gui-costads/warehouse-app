require 'rails_helper'

describe 'Usuário cadastra novo galpão' do
  it 'a partir da página inicial' do
		#Arrange

		#Act
		visit root_path
		click_on 'Cadastrar Galpão'

		#Assert
		expect(page).to have_field('Nome')
		expect(page).to have_field('Código')
		expect(page).to have_field('Cidade')
		expect(page).to have_field('Área')
		expect(page).to have_field('Endereço')
		expect(page).to have_field('Cep')
		expect(page).to have_field('Descrição')
	end  
	it 'com sucesso' do
		#Arrange

		#Act
		visit root_path
		click_on 'Cadastrar Galpão'
		fill_in 'Nome', with: 'Brasília'
		fill_in 'Código', with: 'BSB'
		fill_in 'Cidade', with: 'Brasília'
		fill_in 'Área', with: '30000'
		fill_in 'Endereço', with: 'Av. principal, numero 5'
		fill_in 'Cep', with: '38000-000'
		fill_in 'Descrição', with: 'Galpão do distrito federal'
		click_on 'Salvar'
		
		#Assert
		expect(current_path).to eq root_path
		expect(page).to have_content('Galpão cadastrado com sucesso!')
		expect(page).to have_content('Brasília')
		expect(page).to have_content('BSB')
		expect(page).to have_content('Brasília')
		expect(page).to have_content('30000')
	end
	it 'sem sucesso' do
	#Arrange

	#Act
	visit root_path
	click_on 'Cadastrar Galpão'
	fill_in 'Nome', with: ''
	fill_in 'Código', with:''
	click_on 'Salvar'

	#Assert
	expect(page).to have_content 'Galpão não cadastrado!'
	expect(page).to have_content 'Nome não pode ficar em branco'
	expect(page).to have_content 'Código não pode ficar em branco'
	expect(page).to have_content 'Cidade não pode ficar em branco'
	expect(page).to have_content 'Área não pode ficar em branco'
	expect(page).to have_content 'Endereço não pode ficar em branco'
	expect(page).to have_content 'Cep não pode ficar em branco'
	expect(page).to have_content 'Descrição não pode ficar em branco'
	expect(page).to have_content 'Cep Formato deve ser: xxxxx-xxx'

	end
end