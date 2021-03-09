class CustomersController < ApplicationController

  def index
    @customers = policy_scope(Customer)
  end
end
