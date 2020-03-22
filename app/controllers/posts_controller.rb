class PostsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]

  def index
    if params[:keyword]
      @posts = Post.where('IKE ?', "%#{params[:keyword]}%")
    else
      @posts = Post.all
    end
    @posts = Post.order("id DESC")
    @category_materials = Category.where(id:16..56)
    @category_times = Category.where(id:12..15)
    @category_moneies = Category.where(id:9..11)
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
    @category_parent_array = ["カテゴリ選択"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end  
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def search
    @posts = Post.search(params[:keyword]).order("id DESC")
    @category_materials = Category.where(id:16..56)
    @category_times = Category.where(id:12..15)
    @category_moneies = Category.where(id:9..11)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :material, :category_id, :likes_count).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  
end

