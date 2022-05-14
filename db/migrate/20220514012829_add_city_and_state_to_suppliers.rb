class AddCityAndStateToSuppliers < ActiveRecord::Migration[7.0]
  def change
    add_column :suppliers, :city, :string
    add_column :suppliers, :state, :string
  end
end
