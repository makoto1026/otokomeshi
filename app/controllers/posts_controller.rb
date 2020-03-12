class PostsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]

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
  end

  # def search
  #   @posts = Post.search(params[:keyword])
  #   redirect_to search_posts_path
  # end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :material).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  
end
