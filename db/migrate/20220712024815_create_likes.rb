class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|

      t.timestamps
      t.integer :customer_id
      t.integer :post_id
    end
  end
end
