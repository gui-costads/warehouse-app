require 'rails_helper'

describe 'Usuário edita fornecedor registrado' do
  it 'e vê pagina de edição ' do
		#Arrange
		Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
										city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
										email: 'samsung@email.com', phone_number: '999839823')
			
		#Act
		visit suppliers_path
		click_on 'Samsung'
		click_on 'Editar Fornecedor'

		#Assert
		expect(page).to have_field('Nome Fantasia', with: 'Samsung')
		expect(page).to have_field('Razão Social', with: 'Samsung Company')
		expect(page).to have_field('CNPJ', with: '1234567891234')
		expect(page).to have_field('Cidade', with: 'SP')
		expect(page).to have_field('Estado', with: 'São Paulo')
		expect(page).to have_field('Endereço', with: 'Avenida Coreia do Sul, numero 1000')
		expect(page).to have_field('Email', with: 'samsung@email.com')
		expect(page).to have_field('Telefone', with: '999839823')
	end

	it 'com edita fornecedor com sucesso' do
		#Arrange
		Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
											city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
											email: 'samsung@email.com', phone_number: '999839823')
			
		#Act
		visit suppliers_path
		click_on 'Samsung'
		click_on 'Editar Fornecedor'
		fill_in 'Nome Fantasia', with: 'Samnsungg'
		fill_in 'Razão Social', with: 'Samsuna Eletronics'
		fill_in 'CNPJ', with: '1235676281983'
		click_on 'Salvar'
		#Assert
		expect(page).to have_content('Fornecedor atualizado com sucesso!')
		expect(page).to have_content('Samnsungg')
		expect(page).to have_content('Nome Fantasia: Samnsungg')
		expect(page).to have_content('Razão Social: Samsuna Eletronics')
		expect(page).to have_content('CNPJ: 1235676281983')
		expect(page).to have_content('Cidade: SP')
		expect(page).to have_content('Estado: São Paulo')
		expect(page).to have_content('Endereço: Avenida Coreia do Sul, numero 1000')
		expect(page).to have_content('Email: samsung@email.com')
		expect(page).to have_content('Telefone: 999839823')
	end

	it 'sem sucesso e mantém campos preenchidos' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')
			
		#Act
		visit suppliers_path
		click_on 'Samsung'
		click_on 'Editar Fornecedor'
		fill_in 'Nome Fantasia', with: ''
		fill_in 'Razão Social', with: ''
		fill_in 'CNPJ', with: ''
		fill_in 'Email', with: ''
		click_on 'Salvar'

		#Assert
		expect(page).to have_content('Não foi possível atualizar')
		expect(page).to have_content('Nome Fantasia não pode ficar em branco')
		expect(page).to have_content('Razão Social não pode ficar em branco')
		expect(page).to have_content('Email não pode ficar em branco')
		expect(page).to have_content('CNPJ não pode ficar em branco')
	end
end