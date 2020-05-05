class PostsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]
  before_action :search_post,   only:   [:index, :search]

  def index
  end

  def create
    Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
    child_category = @post.category
    @category_parent_array = []
      @array = Category.where(ancestry: nil).pluck(:name)
      @category_parent_array.push(@array)
      @category_parent_array.flatten!
    @category_children_array = Category.where(ancestry: child_category.ancestry) do
      @category_children_array << children
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def new
    @post = Post.new
    @category_parent_array = ["カテゴリ選択"]
      @array = Category.where(ancestry: nil).pluck(:name)
      @category_parent_array.push(@array)
      @category_parent_array.flatten!
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_id]}", ancestry: nil).children
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
  end
  
  def ngword
    @ngword = Ngword.all
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :material, :recipe1, :recipe2, :recipe3, :image,  :category_id, :likes_count).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def search_post
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order("id DESC")
    @vegetables = Category.where(ancestry:1)
    @meets = Category.where(ancestry:2)
    @fishies = Category.where(ancestry:3)
    @noodles = Category.where(ancestry:4)
    @riceBowls = Category.where(ancestry:5)
  end

  
end

