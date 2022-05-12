class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :trade_name
      t.string :company_name
      t.string :registration_number
      t.string :address
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
