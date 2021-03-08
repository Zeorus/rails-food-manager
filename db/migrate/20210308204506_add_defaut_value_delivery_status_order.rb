class AddDefautValueDeliveryStatusOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :delivery_status, :string, default: "pending"
  end
end
