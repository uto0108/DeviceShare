class Bookmark < ActiveRecord::Migration[6.1]
  def change

    drop_table :bookmarks
  end
end
