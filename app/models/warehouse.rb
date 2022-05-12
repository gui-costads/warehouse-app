class Warehouse < ApplicationRecord
    validates :name, :code, :city, :area, :address, :postal_code, :description, presence: true
    validates :code, length: { is: 3 }
    validates :code, uniqueness: true
    validates :postal_code, format: { with: /\A\d{5}-{1}\d{3}\z/ , message: "Formato deve ser: xxxxx-xxx" }
end
