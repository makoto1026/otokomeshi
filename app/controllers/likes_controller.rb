class LikesController < ApplicationController

  before_action :set_post, only: [:create, :destroy]

  def show
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @like = Like.new(params[:likes_count])
    redirect_to post_path(@post)
  end

  def destroy    
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    redirect_to post_path(@post)
  end

  private

  def likes_params
    params.require(:like).permit(:user_id, :post_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
