require 'rails_helper'

describe 'Usuário vê modelos de produtos' do
	it 'a partir do menu' do 
		#Arrange

		#Act
		visit root_path
		within('nav') do
			click_on 'Modelos de Produtos'
		end

		#Assert
		expect(current_path).to eq product_models_path
	end

	it 'vê modelos de produtos cadastrados' do 
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')

			ProductModel.create!(name: 'Tv 32', weight: 2000, height: 70, width: 20, depth: 10,
								sku: '12345665432123456782', supplier: s)
		#Act
		visit root_path
			within('nav') do
				click_on 'Modelos de Produtos'
			end

		#Assert
		expect(page).to have_content('Samsung')
		expect(page).to have_content('Tv 32')
		expect(page).to have_content('12345665432123456782')
		
	end
	it 'e não existem modelos de produtos cadastrados' do 
		#Arrange
		
		#Act
		visit root_path
		within('nav') do
			click_on 'Modelos de Produtos'	
		end

		#Assert
		expect(current_path).to eq product_models_path
		expect(page).to have_content('Não existem Modelos de Produtos cadastrados!')
	end
end