class AddRecoveryColumnOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :recovery_mode, :string, default: "Livraison"
  end
end
