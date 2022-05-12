class Supplier < ApplicationRecord
  validates :trade_name, :company_name, :registration_number, :email, :city, :state, :address, presence: true
	validates :registration_number, uniqueness: true
	validates :registration_number, length: { is: 13 }
end
