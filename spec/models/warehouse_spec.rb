require 'rails_helper'

RSpec.describe Warehouse, type: :model do
	describe '#valid?' do
		context 'presence' do
			it 'falso quando Nome está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: '', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																	postal_code: '65000-000', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando Código está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: '', city: 'São Luis', address: 'São Luis',
																	postal_code: '65000-000', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando Cidade está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: '', address: 'São Luis',
																	postal_code: '65000-000', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando Endereço está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: '',
																	postal_code: '65000-000', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando postal_code está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																	postal_code: '', area: 50000, description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end
			it 'falso quando Área está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																	postal_code: '65000-000', area: '', description: 'Galpão slz')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end

			it 'falso quando Descrição está vazio' do
				#Arrange
				warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																	postal_code: '65000-000', area: 50000, description: '')
				#Act
				result = warehouse.valid?
				
				#Assert
				expect(result).to eq false
			end
		end

		it 'falso quando Código já está salvo no banco de dados' do
			#Arrange
			first_warehouse = Warehouse.create(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																			   postal_code: '65000-000', area: 50000, description: 'Galpão slz')
			
		  second_warehouse = Warehouse.create(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'Avenida Principal',
																			    postal_code: '65020-000', area: 70000, description: 'Galpão slz secundário')
			#Act
			result = second_warehouse.valid?

			#Assert
			expect(result).to eq false
		end

		it 'verdadeiro quando postal_code está no formato xxxxx-xxx' do
			#Arrange
			warehouse = Warehouse.new(name: 'São Luis', code: 'SLZ', city: 'São Luis', address: 'São Luis',
																postal_code: '65000-000', area: 50000, description: 'Galpão slz')
			
				#Act
			result = warehouse.valid?
			
			#Assert
			expect(result).to eq true
		end
	end
end
