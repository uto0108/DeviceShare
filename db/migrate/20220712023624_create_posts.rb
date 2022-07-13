class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.string :title
      t.string :body
      t.integer :post_image
      t.string :star
      t.integer :customer_id
      t.integer :category_id
    end
  end
end
