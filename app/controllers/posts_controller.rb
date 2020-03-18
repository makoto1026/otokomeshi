class PostsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]

  def index
    if params[:keyword]
      @posts = Post.where('IKE ?', "%#{params[:keyword]}%")
    else
      @posts = Post.all
      # @parents = Category.all.order("id ASC").limit(3)
    end
    # @parents = Category.all.order("id ASC").limit(3)
    @posts = Post.order("id DESC")

  end

  def create
    Post.create(post_params)
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
    # @category = Category.all.order("id ASC").limit(3) # categoryの親を取得
    # respond_to do |format|
    #   format.json
    #   format.html
    # end
  end

  # def category_children  
  #   @category_children = Category.find(params[:name]).children 
  #   end
  # # Ajax通信で送られてきたデータをparamsで受け取り､childrenで子を取得

  # def category_grandchildren
  #   @category_grandchildren = Category.find(params[:name]).children
  #   end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    # @category = Category.new

  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def search
    @posts = Post.search(params[:keyword]).order("id DESC")
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
