class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @customers = Customer.looks(params[:search], params[:word])
    @posts = Post.looks(params[:search], params[:word])
  end
end
