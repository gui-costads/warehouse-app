require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
		it 'falso quando Nome Fantasia está vazio' do
			#Arrange
			s = Supplier.new(trade_name: '', company_name: 'Samsung Company', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo',	address: 'Avenida Coreia do Sul, numero 1000', email: 'samsung@email.com', phone_number: '999839823')
			
				#Act
			result = s.valid?

			#Assert
			expect(result).to eq false
		end
		it 'falso quando Razão Social está vazio' do
			#Arrange
			s = Supplier.new(trade_name: 'Samsung', company_name: '', registration_number: '1234567891234',
				city: 'SP', state: 'São Paulo',	address: 'Avenida Coreia do Sul, numero 1000', email: 'samsung@email.com', phone_number: '999839823')
			
				#Act
			result = s.valid?

			#Assert
			expect(result).to eq false
		end

		it 'falso quando CNPJ está vazio' do
			#Arrange
			s = Supplier.new(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '',
				city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000', email: 'samsung@email.com', phone_number: '999839823')
		
			#Act
			result = s.valid?

			#Assert
			expect(result).to eq false
		end

		it 'falso quando CNPJ ja está salvo no banco de dados' do
			#Arrange
			s1 = Supplier.create(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
													 city: 'SP', state: 'São Paulo', address: 'Avenida Coreia do Sul, numero 1000',
													 email: 'samsung@email.com', phone_number: '999839823')

			s2 = Supplier.create(trade_name: 'Sony', company_name: 'Sony Company', registration_number: '1234567891234',
													 city: 'SP', state: 'São Paulo', address: 'Avenida Japão, numero 1000', 
													 email: 'sony@email.com', phone_number: '999219823')
			
				#Act
			result = s2.valid?
	
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Cidade está vazio' do
			#Arrange
			s = Supplier.new(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
												city: '', state: 'São Paulo', address:'Avenida Coreia do Sul, numero 1000', 
												email: 'samsung@email.com', phone_number: '999839823')

			#Act
			result = s.valid?

			#Assert
			expect(result).to eq false
		end

		it 'falso quando Estado está vazio' do
			#Arrange
			s = Supplier.new(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
												city: 'SP', state: '',	address:'Avenida Coreia do Sul, numero 1000', 
												email: 'samsung@email.com', phone_number: '999839823')

			#Act
			result = s.valid?
			
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Endereço está vazio' do
			#Arrange
			s = Supplier.new(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
											city: 'SP', state: 'São Paulo', address:'', email: 'samsung@email.com',
											phone_number: '999839823')
			#Act
			result = s.valid?
			#Assert
			expect(result).to eq false
		end

		it 'falso quando Email está vazio' do
			#Arrange
			s = Supplier.new(trade_name: 'Samsung', company_name: 'Samsung Company', registration_number: '1234567891234',
											 city: 'SP', state: 'São Paulo', address:'Avenida Coreia do Sul, numero 1000', 
											 email: '', phone_number: '999839823')

			#Act
			result = s.valid?
			
			#Assert
			expect(result).to eq false
		end
	end
end
