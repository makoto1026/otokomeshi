class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
  end

  def edit
  end

  def new
  end

  def show
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image).merge(user_id: current_user.id)
  end

  
end
