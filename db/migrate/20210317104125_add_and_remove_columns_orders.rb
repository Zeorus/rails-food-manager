class AddAndRemoveColumnsOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :rider_id
    add_column :orders, :step, :integer
    add_reference :orders, :delivery_route, foreign_key: true
  end
end
