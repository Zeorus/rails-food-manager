class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order)
  end

  def new 
    @order = Order.new
    authorize @order
    @products = Product.all
    @customer = Customer.where(phone_number: params[:query])[0]
    @order.customer = @customer
    if params[:query] != nil && @customer == nil
      redirect_to customers_path, notice: "\"#{params[:query]}\# is an unknown number"
    end
  end
end
