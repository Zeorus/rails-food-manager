class AddColumnStatusToDeliveryRoutes < ActiveRecord::Migration[6.1]
  def change
    add_column :delivery_routes, :status, :string, default: "delivering"
  end
end
