class AddmaterialToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :material, :string
  end
end
