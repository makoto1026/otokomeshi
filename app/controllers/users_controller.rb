class UsersController < ApplicationController

  def edit
    @posts = current_user.posts
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email).merge(user_id: current_user.id)
  end
end

