class ChangeColumnPayementOrder < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :payement, :payment_method
  end
end
