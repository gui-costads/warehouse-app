require 'rails_helper'

RSpec.describe ProductModel, type: :model do
	describe '#valid?' do
		it 'falso quando Nome está vazio' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: '', weight: 2000, height: 70, width: 20, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Peso está vazio' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: nil , height: 70, width: 20, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Peso é igual a zero' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 0, height: 70, width: 20, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end
		it 'falso quando Peso é menor que zero' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: -1, height: 70, width: 20, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Altura está vazio' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000 , height: nil, width: 20, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Altura é igual a zero' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: 0, width: 20, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end
		it 'falso quando Altura é menor que zero' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: -1, width: 20, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end
		
		it 'falso quando Largura está vazio' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000 , height: 70, width: nil, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Largura é igual a zero' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: 70, width: 0, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end
		it 'falso quando Largura é menor que zero' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: 70, width: -1, depth: 10,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end
		
		it 'falso quando Profundidade está vazio' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000 , height: 70, width: 20, depth: nil,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Profundidade é igual a zero' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: 70, width: 20, depth: 0,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end
		it 'falso quando Profundidade é menor que zero' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: 70, width: 20, depth: -1,
									sku: '12345665432123456782', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando SKU esta vazio' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: 70, width: 20, depth: 10,
									sku: '', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando SKU é menor  20' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: 70, width: 20, depth: 10,
									sku: '24352435126735289', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando SKU é maior 20' do
			#Arrange
			s = Supplier.create!(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', 
				email: 'samsung@email.com', phone_number: '999839823')
	
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: 70, width: 20, depth: 10,
									sku: '2435243512182378126321236735289', supplier: s)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Fornecedor esta vazio' do
			#Arrange
			pm = ProductModel.new(name: 'Tv 42', weight: 2000, height: 70, width: 20, depth: 10,
									sku: '12345665432123456782', supplier: nil)
			
			#Act
			result = pm.valid?
			
			#Assert
			expect(result).to eq false
		end

	end
end
