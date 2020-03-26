class CategoriesController < ApplicationController
  def show
    if params[:id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:id])
       
      # category_idと紐づく投稿を取得
      @posts = @category.posts.order(created_at: :desc).all
    else
      # 投稿すべてを取得
      @posts = Post.order(created_at: :desc).all
    end
    # @post = Post.find(params[:category_id])
      # @category = @categories.posts.order(created_at: :desc).all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :material, :category_id, :likes_count)
  end
end
