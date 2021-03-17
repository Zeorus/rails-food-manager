class DeliveryRoutesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized

  def create
    orders_list = params[:ordersList].split(/,/)
    rider_id = params[:rider].gsub(/\D*/, "").to_i
    @rider = User.find(rider_id)
    @delivery_route = DeliveryRoute.create(user: @rider)
    orders_list.each_with_index do |order_id, index|
      order = Order.find(order_id.to_i)
      order.update(delivery_route: @delivery_route, 
                   step: index + 1,
                   delivery_status: "delivering")
    end
    redirect_to geolocation_path, notice: "Deliveries correctly attributed to #{@rider.first_name} #{@rider.last_name}"
  end

end
