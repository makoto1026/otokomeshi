class UsersController < ApplicationController

  def edit
    @posts = current_user.posts
    @posts = Post.order("id DESC")
  end

  def update
    if current_user.update(user_params)
      redirect_to edit_user_path(current_user)
    else
      redirect_to 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email).merge(id: current_user.id)
  end
end

