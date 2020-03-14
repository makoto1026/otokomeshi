class LikesController < ApplicationController

  before_action :set_like

  def create
    @like = Like.create(user_id: current_user.id, post_id: @post.id)
  end

  def destroy    
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @like.destroy
  end

  private

  def set_like
    @post = Post.find_by(params[:post_id])
  end
end
