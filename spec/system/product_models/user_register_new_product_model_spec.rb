require 'rails_helper'

describe 'Usuário registra Modelo de Produto' do
	it 'a partir do Modelos de Produtos' do
		#Arrange

		#Act
		visit root_path
		within('nav') do
			click_on 'Modelos de Produtos'	
		end
		click_on 'Cadastrar Modelo'

		#Assert
		expect(current_path).to eq new_product_model_path
		expect(page).to have_field('Nome')
		expect(page).to have_field('Peso')
		expect(page).to have_field('Altura')
		expect(page).to have_field('Largura')
		expect(page).to have_field('Profundidade')
		expect(page).to have_field('SKU')
		expect(page).to have_field('Fornecedor')
  end

	it 'com sucesso' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')
		
		#Act
		visit root_path
		within('nav') do
			click_on 'Modelos de Produtos'	
		end
		click_on 'Cadastrar Modelo'
		fill_in 'Nome', with: 'Galaxy s20'
		fill_in 'Peso', with:  200
		fill_in 'Altura', with: 16
		fill_in 'Largura', with: 7
		fill_in 'Profundidade', with: 3
		fill_in 'SKU', with: '24352435226735289765'
		select 'Samsung', from: 'Fornecedor'
		click_on 'Salvar'

		#Assert
		expect(page).to have_content('Modelo de produto cadastrado!')
		expect(page).to have_content('Samsung')
		expect(page).to have_content('Galaxy s20')
		expect(page).to have_content('24352435226735289765')
	end

	it 'sem sucesso' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')
		
		#Act
		visit root_path
		within('nav') do
			click_on 'Modelos de Produtos'	
		end
		click_on 'Cadastrar Modelo'
		fill_in 'Nome', with: ''
		fill_in 'Peso', with:  nil
		fill_in 'Altura', with: nil
		fill_in 'Largura', with: nil
		fill_in 'Profundidade', with: nil
		fill_in 'SKU', with: ''
		select 'Samsung', from: 'Fornecedor'
		click_on 'Salvar'

		#Assert
		expect(page).to have_content('Modelo de produto nao foi cadastrado!')
		expect(page).to have_content('Nome não pode ficar em branco')
		expect(page).to have_content('Peso não pode ficar em branco')
		expect(page).to have_content('Altura não pode ficar em branco')
		expect(page).to have_content('Largura não pode ficar em branco')
		expect(page).to have_content('Profundidade não pode ficar em branco')
		expect(page).to have_content('SKU não pode ficar em branco')
	end
end