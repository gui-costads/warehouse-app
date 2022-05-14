require 'rails_helper'


describe 'Usuário vê detalhes de um Modelo de produto' do
  it 'e vê informações adicionais' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')

		pm = ProductModel.create!(name: 'Tv 32', weight: 2000, height: 70, width: 20, depth: 10,
								sku: '12345665432123456782', supplier: s)
		#Act
		visit root_path
			within('nav') do
				click_on 'Modelos de Produtos'
			end
		click_on 'Tv 32'
		
		#Assert
		expect(current_path).to eq product_model_path(pm.id)
		expect(page).to have_content('Samsung')
		expect(page).to have_content('Tv 32')
		expect(page).to have_content('2000')
		expect(page).to have_content('70')
		expect(page).to have_content('20')
		expect(page).to have_content('10')
		expect(page).to have_content('12345665432123456782')
	end

	it 'e volta para lista de Modelos de Produtos' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')

		pm =	ProductModel.create!(name: 'Tv 32', weight: 2000, height: 70, width: 20, depth: 10,
								sku: '12345665432123456782', supplier: s)
		#Act
		visit product_models_path	
		click_on 'Tv 32'
		within('nav') do
			click_on 'Modelos de Produtos'
		end
		
		#Assert
		expect(current_path).to eq product_models_path
	end
	
	it 'e volta para lista de Fornecedores' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')

		pm =	ProductModel.create!(name: 'Tv 32', weight: 2000, height: 70, width: 20, depth: 10,
								sku: '12345665432123456782', supplier: s)
		#Act
		visit product_models_path	
		click_on 'Tv 32'
		within('nav') do
			click_on 'Modelos de Produtos'
		end
		
		#Assert
		expect(current_path).to eq product_models_path
	end

	it 'e volta para tela inicial' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')

		pm =	ProductModel.create!(name: 'Tv 32', weight: 2000, height: 70, width: 20, depth: 10,
								sku: '12345665432123456782', supplier: s)
								
		#Act
		visit product_models_path	
		click_on 'Tv 32'
		click_on 'Voltar para Galpões'
		
		#Assert
		expect(current_path).to eq root_path
	end
end