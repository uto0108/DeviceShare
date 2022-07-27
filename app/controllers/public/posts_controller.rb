class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @post = Post.new
  end

  def index
   @posts = params[:category_id].present? ? Category.find(params[:category_id]).posts : Post.all
   
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:customer)
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to public_posts_path
    else
      redirect_to new_public_post_path
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :star, :customer_id, :category_id)
  end
end
