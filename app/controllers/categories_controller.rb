class CategoriesController < ApplicationController
  def show
    @posts = Post.search(params[:keyword]).order("id DESC")
    @category_materials = Category.where(id:16..56)
    @category_times = Category.where(id:12..15)
    @category_moneies = Category.where(id:9..11)
  end
end
