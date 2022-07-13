class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end

 def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to public_posts_path
    else
       redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :star, :customer_id, :category_id)
  end
end
