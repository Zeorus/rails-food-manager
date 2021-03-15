class RemoveColumnsLatLongOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :latitude
    remove_column :orders, :longitude
  end
end
