class AddColumnPosts2 < ActiveRecord::Migration[5.0]
  def up
  end

  def down
    remove_column :posts, :category, :integer
  end
end
