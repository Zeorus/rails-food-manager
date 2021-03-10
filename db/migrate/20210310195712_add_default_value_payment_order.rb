class AddDefaultValuePaymentOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :payment_method, :string, default: "CB"
  end
end
