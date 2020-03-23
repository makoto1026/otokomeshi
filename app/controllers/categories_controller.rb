# class CategoriesController < ApplicationController
#   def show
#     if  params[:category_id]
#       @category = Category.find(params[:category_id])
#       @cate = @category.posts.order(created_at: :desc).all
#     else
#       @posts = Post.all
#     end
#   end
# end
