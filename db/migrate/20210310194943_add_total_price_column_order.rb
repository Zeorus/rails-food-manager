class AddTotalPriceColumnOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :total_price, :float, default: 0.00
  end
end
