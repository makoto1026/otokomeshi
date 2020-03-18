class AddColumnPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :category_id, :int 
  end
end
