class PostsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]

  def index
    if params[:keyword]
      @posts = Post.where('IKE ?', "%#{params[:keyword]}%")
    else
      @posts = Post.all
    end
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :material, :keyword).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  
end
