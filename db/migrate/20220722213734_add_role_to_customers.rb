class AddRoleToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :role, :integer
  end
end
