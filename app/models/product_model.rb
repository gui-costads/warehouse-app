class ProductModel < ApplicationRecord
  belongs_to :supplier
  validates :name, :weight, :height, :depth, :width, :sku, :supplier, presence:true
  validates :weight, :height, :depth, :width, numericality: { greater_than: 0 }
  validates :sku, length: { is: 20 }
end
