class AddCategoryToPosts < ActiveRecord::Migration[5.0]
  def up
    add_column :posts, :category, :string
  end

  def down
    remove_column :posts, :category_id, :int
  end
end
