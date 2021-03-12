class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order)
  end

  def show
  @order = Order.find(params[:id])
  authorize @order
  end

  def new
    @order = Order.new
    authorize @order
    @products = Product.all
    @categories = Category.all
    @customer = Customer.find_by(phone_number: params[:query])
    if params[:query] != nil && @customer == nil
      redirect_to customers_path, notice: "\"#{params[:query]}\# is an unknown number"
    end
  end

  def create
    @order = Order.new(order_params)
    authorize @order
    @order.customer = Customer.find_by(phone_number: params[:customer])
    order_products = params[:products]
    if @order.save
      unless order_products == nil
        order_products.each do |product, quantity|
          order_product = OrderProduct.new(product_id: product.to_i, quantity: quantity)
          order_product.order = @order
          order_product.save
        end
        redirect_to order_path(@order), notice: "Order was successfully created"
      else
        @order.destroy
        redirect_to new_order_path(query: params[:customer]), notice: "An order must have products"
      end
    else
      redirect_to new_order_path, notice: "An order must have a valid customer"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    redirect_to orders_path, notice: "Order was successfully deleted"
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    @order.update(order_params)
    redirect_to order_path(@order), notice: "Delivery Status was successfully updated"
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :recovery_mode, :total_price, :delivery_status)
  end
end
