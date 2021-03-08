class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :email

      t.timestamps
    end
  end
end
