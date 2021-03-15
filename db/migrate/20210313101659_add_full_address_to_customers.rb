class AddFullAddressToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :full_address, :string
  end
end
