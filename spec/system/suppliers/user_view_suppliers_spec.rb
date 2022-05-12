require 'rails_helper'

describe 'Usuário vê fornecedores' do
	it 'a partir do menu' do 
		#Arrange
		
		#Act
		visit root_path
		within('nav') do
			click_on 'Fornecedores'
		end
		#Assert
		expect(current_path).to eq suppliers_path
	end		

	it 'e vê galpões cadastrados' do
	  #Arrange
		Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
										address: 'Avenida Coreia do Sul, numero 1000', email: 'samsung@email.com', phone_number: '999839823')
		#Act
		visit root_path
		within('nav') do
			click_on 'Fornecedores'	
		end
		#Assert
		expect(current_path).to eq suppliers_path
		expect(page).to have_content('Samsung')
		expect(page).to have_content('Samsung Company')
		expect(page).to have_content('1234567891234')
	end

	it 'e não existem galpões cadastrados' do 
		#Arrange
		
		#Act
		visit root_path
		within('nav') do
			click_on 'Fornecedores'	
		end
		#Assert
		expect(current_path).to eq suppliers_path
		expect(page).to have_content('Não existem Fornecedores cadastrados!')
	end
end

