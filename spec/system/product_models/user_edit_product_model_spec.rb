require 'rails_helper'


describe 'Usuário edita um Modelo de produto registrado' do
  it 'e vê pagina de edição' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')

		pm =	ProductModel.create!(name: 'Tv 32', weight: 2000, height: 70, width: 20, depth: 10,
								sku: '12345665432123456782', supplier: s)
		#Act
		visit product_models_path	
		click_on 'Tv 32'
        click_on 'Editar Modelo'
		
		#Assert
		expect(page).to have_field('Nome')
		expect(page).to have_field('Peso')
		expect(page).to have_field('Altura')
		expect(page).to have_field('Largura')
		expect(page).to have_field('Profundidade')
		expect(page).to have_field('SKU')
		expect(page).to have_field('Fornecedor')
	end
  
	it 'e edita com sucesso' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')

		pm =	ProductModel.create!(name: 'Tv 32', weight: 2000, height: 70, width: 20, depth: 10,
								sku: '12345665432123456782', supplier: s)
		#Act
		visit product_models_path	
		click_on 'Tv 32'
		click_on 'Editar Modelo'
		fill_in 'Nome', with: 'Tv 42'
		fill_in 'SKU', with: '24352435126735289765'
		click_on 'Salvar'
		
		#Assert
    expect(page).to have_content('Modelo de produto atualizado com sucesso!')
		expect(page).to have_content('Tv 42')
		expect(page).to have_content('24352435126735289765')
	end

  it 'e edita sem sucesso' do
		#Arrange
		s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
			city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
			email: 'samsung@email.com', phone_number: '999839823')

		pm =	ProductModel.create!(name: 'Tv 32', weight: 2000, height: 70, width: 20, depth: 10,
								sku: '12345665432123456782', supplier: s)

		#Act
		visit product_models_path	
		click_on 'Tv 32'
		click_on 'Editar Modelo'
		fill_in 'Nome', with: ''
		fill_in 'SKU', with: ''
		fill_in 'Peso', with: ''
		click_on 'Salvar'
		
		#Assert
		expect(page).to have_content('Não foi possivel atualizar Modelo de produto')
		expect(page).to have_content('Nome não pode ficar em branco')
		expect(page).to have_content('Peso não pode ficar em branco')
		expect(page).to have_content('SKU não pode ficar em branco')
	end
end
