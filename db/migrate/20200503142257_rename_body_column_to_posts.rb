class RenameBodyColumnToPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :body, :recipe1
  end
end


