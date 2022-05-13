require 'rails_helper'

describe 'Usuário remove um galpão cadastrado' do
	it 'com sucesso'do
		#Arrange
		Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
      								address: 'Avenida do Aeroporto, 1000', postal_code: '15000-000',
      								description: 'Galpão destinado para cargas internacionais')
		#Act
		visit (root_path)
		click_on 'Aeroporto SP'
		expect(page).to have_content('Nome: Aeroporto SP')
		expect(page).to have_content('Código: GRU')
		click_on 'Remover'
		
		#Assert
		expect(current_path).to eq root_path
		expect(page).to have_content('Galpão removido com sucesso!')
		expect(page).not_to have_content('Nome: Aeroporto SP')
		expect(page).not_to have_content('Código: GRU')

	end

	it 'e não apaga outros galpões' do
		#Arrange
		w1 = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
													 address: 'Avenida do Aeroporto, 1000', postal_code: '15000-000',
													 description: 'Galpão destinado para cargas internacionais')
		w2 = Warehouse.create!(name: 'Rio', code: 'RIO',  city: 'Rio de Janeiro', area: 70_000,
														address: 'Av principal, numero 1000', postal_code: '31000-000',
														description: 'Galpão principal do Rio de Janeiro')

		#Act
		visit (root_path)
		click_on 'Aeroporto SP'
		expect(page).to have_content('Nome: Aeroporto SP')
		expect(page).to have_content('Código: GRU')
		click_on 'Remover'
		#Assert
		expect(current_path).to eq root_path
		expect(page).to have_content('Galpão removido com sucesso!')
		expect(page).not_to have_content('Nome: Aeroporto SP')
		expect(page).not_to have_content('Código: GRU')
		expect(page).to have_content('Nome: Rio')
	end
end