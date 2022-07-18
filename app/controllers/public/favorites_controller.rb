class Public::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if @post.customer_id != current_customer.id   # 自分の投稿以外にお気に入り登録が可能
      @favorite = Favorite.create(customer_id: current_customer.id, post_id: @post.id)
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @favorite = Favorite.find_by(customer_id: current_customer.id, post_id: @post.id)
    @favorite.destroy
  end
end
