class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    Post.create(post_params)
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def show
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :material).merge(user_id: current_user.id)
  end

  
end
