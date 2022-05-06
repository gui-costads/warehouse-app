require 'rails_helper'

RSpec.describe Warehouse, type: :model do
	describe '#valid?' do
		context 'presence' do
			it 'falso quando Nome está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: '', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																	cep: '65000-000', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando Código está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: '', city: 'São Luis', address: 'São Luis',
																	cep: '65000-000', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando Cidade está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: '', address: 'São Luis',
																	cep: '65000-000', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando Endereço está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: '',
																	cep: '65000-000', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando Cep está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																	cep: '', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end
			it 'falso quando Área está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																	cep: '65000-000', area: '', description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando Descrição está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																	cep: '65000-000', area: 50000, description: '')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end
		end

		it 'falso quando Código já está no banco de dados' do
			#Arrange
			first_warehouse = Warehouse.create(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																			cep: '65000-000', area: 50000, description: 'Galpão slz')
			
		  second_warehouse = Warehouse.create(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'Avenida Principal',
																			 cep: '65020-000', area: 70000, description: 'Galpão slz secundário')
			#Act
			result = second_warehouse.valid?

			#Assert
			expect(result).to eq false
		end
	end
end
