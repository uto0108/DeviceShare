class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts

  end

  def edit
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(admin_customer_params)
    if @customer.save
      redirect_to admin_customer_path(), notice: "You have updated user successfully."
    else
      render "show"
    end
  end

  private
  def admin_customer_params
    params.require(:customer).permit(:name, :email, :post_image, :profile_image, :is_deleted)
  end
end
