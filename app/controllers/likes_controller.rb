class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    @likes = Like.where(post_id: params[:post_id])
    get_post
  end

  def destroy    
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    @likes = Like.where(post_id: params[:post_id])
    get_post
  end

  def get_post
    @post = Post.find(params[:post_id])
  end
end
