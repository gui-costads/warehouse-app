require 'rails_helper'

describe 'Usuário cadastra novo fornecedor' do 
	it 'a partir do menu' do
		#Arrange

		#Act
		visit root_path
		within('nav') do
			click_on 'Fornecedores'	
		end
		click_on 'Cadastrar Fornecedor'
		
		#Assert
		expect(page).to have_content('Nome Fantasia')
		expect(page).to have_content('Razão Social')
		expect(page).to have_content('CNPJ')
		expect(page).to have_content('Endereço')
		expect(page).to have_content('Cidade')
		expect(page).to have_content('Estado')
		expect(page).to have_content('Email')
		expect(page).to have_content('Telefone')
		end
	
	it 'com sucesso' do
		#Arrange

		#Act
		visit root_path
		within ('nav') do
		click_on 'Fornecedores'	
		end
		click_on 'Cadastrar Fornecedor'
		fill_in 'Nome Fantasia', with: 'Samsung'
		fill_in 'Razão Social', with: 'Samsung Eletronics'
		fill_in 'CNPJ', with: '1234567891234'
		fill_in 'Endereço', with: 'Av Coreia do Sul, numero 1000'
		fill_in 'Cidade', with: 'SP'
		fill_in 'Estado', with: 'São Paulo'
		fill_in 'Email', with: 'Samsung@samsung.com'
		fill_in 'Telefone', with: '559278123021'
		click_on 'Salvar'

		#Assert
		expect(current_path).to eq suppliers_path
		expect(page).to have_content('Samsung')
		expect(page).to have_content('Samsung Eletronics')
		expect(page).to have_content('1234567891234')	
	end
	it 'sem sucesso' do
		#Arrange

		#Act
		visit root_path
		within ('nav') do
		click_on 'Fornecedores'	
		end
		click_on 'Cadastrar Fornecedor'
		fill_in 'Nome Fantasia', with: ''
		fill_in 'Razão Social', with: ' '
		fill_in 'CNPJ', with: ''
		fill_in 'Cidade', with: 'SP'
		fill_in 'Estado', with: 'São Paulo'
		fill_in 'Endereço', with: 'Av Coreia do Sul, numero 1000'
		fill_in 'Email', with: ''
		fill_in 'Telefone', with: '559278123021'
		click_on 'Salvar'
		
		#Assert
		expect(current_path).to eq suppliers_path
		expect(page).to have_content('Nome Fantasia não pode ficar em branco')
		expect(page).to have_content('Razão Social não pode ficar em branco')
		expect(page).to have_content('Email não pode ficar em branco')
		expect(page).to have_content('CNPJ não possui o tamanho esperado (13 caracteres)')
	end
end 