class HomesController < ApplicationController
  def top
    @posts = Post.includes(:liked_customers).limit(4).sort {|a,b| b.liked_customers.size <=> a.liked_customers.size}
  end

  def about
  end
end
