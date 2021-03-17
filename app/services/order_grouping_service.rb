class OrderGroupingService

  def initialize(orders)
    @orders = orders
  end

  def call
    # TODO
  end

  def regroup
    orders_list = distances(@orders, 50.70328140258789, 3.201368808746338)
    groups = []
    while orders_list.length > 0
      group = []
      first_waypoint = orders_list.first
      orders_list.delete(first_waypoint)
      rest_orders = distances(orders_list, first_waypoint.customer.latitude, first_waypoint.customer.longitude)
      group << first_waypoint
      rest_orders.first(3).each do |order|
        group << order
        orders_list.delete(order)
      end
      groups << group
    end
    return groups
  end

  private

  def distances(orders_list, my_lat, my_lon)
    distances = {}
    orders_list.each do |order|
        lat = order.customer.latitude
        lon = order.customer.longitude
        dist = Geocoder::Calculations.distance_between([lat,lon], [my_lat, my_lon]).round(2)
        distances["#{dist}"] = order
      end
    @distances = distances.sort_by { |k, v| k.to_f }.map { |couple| couple[1] }
  end

end
