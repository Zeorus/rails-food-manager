class DeliveryRoutesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    delivery_routes = DeliveryRoute.all
    @today_deliveries = []
    @old_deliveries = []
    delivery_routes.each do |delivery|
      if delivery.created_at.to_date == Date.current
        @today_deliveries << delivery
      else
        @old_deliveries << delivery
      end
    end
  end

  def show
    @delivery_route = DeliveryRoute.find(params[:id])
    @markers = markers(@delivery_route)
  end

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

  def update
    @delivery_route = DeliveryRoute.find(params[:id])
    @delivery_route.update!(delivery_route_params)
    @delivery_route.orders.each do |order|
      if @delivery_route.status == "delivered"
        order.update!(delivery_status: "delivered")
      else
        order.update!(delivery_status: "delivering")
      end
    end
    redirect_to delivery_route_path(@delivery_route), notice: "Delivery Status was successfully updated"
  end

  private

  def delivery_route_params
    params.require(:delivery_route).permit(:status)
  end

  def markers(delivery_route)
    @markers = []
    delivery_route.orders.each do |order|
      @markers << { lat: order.customer.latitude,
                    lng: order.customer.longitude,
                    infoWindow: render_to_string(partial: "shared/info_window", locals: { customer: order.customer }),
                  }
    end
    @markers << { lat: 50.70328140258789, 
                  lng: 3.201368808746338, 
                  infoWindow: render_to_string(partial: "shared/info_window", locals: { customer: nil }),
                  id: 0  
                }
    return @markers
  end

end
