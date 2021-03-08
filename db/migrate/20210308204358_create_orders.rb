class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :payement
      t.string :delivery_status
      t.string :rider_id

      t.timestamps
    end
  end
end
