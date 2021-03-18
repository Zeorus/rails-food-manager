class ChangeColumnDeliveryIdToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :delivery_route_id, :integer, null: true
  end
end
