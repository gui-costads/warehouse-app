require 'rails_helper'

describe 'Usuário vê detalhes de um fornecedor' do
	it 'e vê informações adicionais' do
		#Arrange
		Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
		city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
		email: 'samsung@email.com', phone_number: '999839823')
		
		#Act
		visit suppliers_path
		click_on 'Samsung'
		
		#Assert
		expect(page).to have_content('Samsung')
		expect(page).to have_content('Samsung Company')
		expect(page).to have_content('1234567891234')
		expect(page).to have_content('SP')
		expect(page).to have_content('São Paulo')
		expect(page).to have_content('Avenida Coreia do Sul, numero 1000')
		expect(page).to have_content('samsung@email.com')
		expect(page).to have_content('999839823')
	end

	it 'e volta para lista de fornecedores' do
		#Arrange
		Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
		city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
		email: 'samsung@email.com', phone_number: '999839823')
		
		#Act
		visit suppliers_path
		click_on 'Samsung'
		click_on 'Fornecedores'
		
		#Assert
		expect(current_path).to  eq suppliers_path
	end
	it 'e volta para tela inicial' do
		#Arrange
		Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
		city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
		email: 'samsung@email.com', phone_number: '999839823')
		
		#Act
		visit suppliers_path
		click_on 'Samsung'
		click_on 'Voltar para Galpões'
		
		#Assert
		expect(current_path).to  eq root_path
	end
end