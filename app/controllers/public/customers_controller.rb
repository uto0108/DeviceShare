class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.order(created_at: :desc)
  end

  def edit
     @customer = Customer.find(params[:id])
    if @customer == current_customer
        render "edit"
    else
      redirect_to public_customer_path(@customer)
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(public_customer_params)
    if @customer.save
      redirect_to public_customer_path(), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def withdraw
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def public_customer_params
    params.require(:customer).permit(:name, :email, :post_image, :profile_image, :is_deleted)
  end

end
