class AddColumnIconCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :icon, :string, default: "missing.png"
  end
end
