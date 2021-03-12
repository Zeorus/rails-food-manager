class CustomersController < ApplicationController
  before_action :find_customer, only: [:edit, :update, :destroy]

  def index
    @customers = policy_scope(Customer)
    if params[:query].present?
      sql_query = " \
        first_name ILIKE :query \
        OR last_name ILIKE :query \
        OR phone_number ILIKE :query \
      "
      @customers = Customer.where(sql_query, query: "%#{params[:query]}%")
    else
      @customers = Customer.all.order(last_name: :desc)
    end
  end

  def create
    @customer = Customer.new(customer_params)
    authorize @customer
    if @customer.save
      redirect_to new_order_path(query: @customer.phone_number), notice: "Customer was successfully created"
    else
      render :new, notice: "Error. Invalid information"
    end
  end

  def edit
    authorize @customer
  end

  def update
    authorize @customer
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "Customer was successfully updated"
    else
      render :edit, notice: "Error. Invalid information"
    end
  end

  def destroy
    authorize @customer
    @customer.destroy
    redirect_to customers_path
  end

  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :address, :zip_code, :city, :email)
  end

end
