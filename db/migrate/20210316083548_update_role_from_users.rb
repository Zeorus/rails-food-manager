class UpdateRoleFromUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :role, from: "admin", to: "rider"
  end
end
