class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.order(created_at: :desc)
    @q = Post.ransack(params[:q])
    @vegetables = Category.where(ancestry:1)
    @meets = Category.where(ancestry:2)
    @fishies = Category.where(ancestry:3)
    @noodles = Category.where(ancestry:4)
    @riceBowls = Category.where(ancestry:5)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :material, :category_id, :likes_count)
  end
end
