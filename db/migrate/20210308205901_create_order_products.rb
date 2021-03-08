class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.boolean :belongs_menu, default: false

      t.timestamps
    end
  end
end
