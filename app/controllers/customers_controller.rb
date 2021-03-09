class CustomersController < ApplicationController
  before_action :find_customer, only: [:edit, :update, :destroy]

  def index
    @customers = policy_scope(Customer)
  end

  def new
    @customer = Customer.new
    authorize @customer
  end


  def create
    @customer = Customer.new(customer_params)
    authorize @customer
    if @customer.save
      redirect_to @customers, notice: "Customer was successfully created"
    else
      render :new
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
      render :edit
    end
  end

  def destroy
    authorize @customer
    @customer.destroy
    head :no_content
  end


  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :address, :zip_code, :city, :email)
  end

end
