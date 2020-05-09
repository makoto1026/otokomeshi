class AddColumnPosts2 < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :recipe2, :string 
    add_column :posts, :recipe3, :string 
  end

  def down
    remove_column :posts, :category, :integer
  end
end
