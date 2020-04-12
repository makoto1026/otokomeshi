class UsersController < ApplicationController


  def index
    @posts = current_user.posts.order("id DESC")
  end

  def show
  end

  def edit
    @posts = current_user.posts.order("id DESC")    
  end

  def update
    if current_user.update(user_params)
    else
      redirect_to 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

