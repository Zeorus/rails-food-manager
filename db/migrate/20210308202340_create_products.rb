class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :sub_category
      t.float :price
      t.float :price_in_menu

      t.timestamps
    end
  end
end
