class AddProfileImageToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :profile_image, :integer
  end
end
