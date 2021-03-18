class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  # require 'Date'

  def home
    redirect_to dashboard_path
  end

  def dashboard


    # -------------previous week--------------

    @previous_week = Time.now.strftime('%W').to_i - 1
    year = Time.now.year.to_i
    @monday_p = Date.commercial(year, @previous_week, 1)
    @tuesday_p = Date.commercial(year, @previous_week, 2)
    @wednesday_p = Date.commercial(year, @previous_week, 3)
    @thursday_p = Date.commercial(year, @previous_week, 4)
    @friday_p = Date.commercial(year, @previous_week, 5)
    @saturday_p = Date.commercial(year, @previous_week, 6)
    @sunday_p = Date.commercial(year, @previous_week, 7)

    @count = 0
    Order.all.each do |order|
      if order.created_at.to_date == Date.current
        @count += order.total_price
      end
    end

    @target = Order.where(created_at: ( DateTime.now.at_beginning_of_day - 7..DateTime.now.at_end_of_day - 7)).sum(:total_price) * 1.1
    @today_order = Order.where(created_at: ( DateTime.now.at_beginning_of_day..DateTime.now.at_end_of_day)).count

    @mon_order = []
    @tue_order = []
    @wed_order = []
    @thu_order = []
    @fri_order = []
    @sat_order = []
    @sun_order = []


    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@monday_p.to_s}"
        @mon_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@tuesday_p.to_s}"
        @tue_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@wednesday_p.to_s}"
        @wed_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@thursday_p.to_s}"
        @thu_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@friday_p.to_s}"
        @fri_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@saturday_p.to_s}"
        @sat_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@sunday_p.to_s}"
        @sun_order << order
      end
    end

    @mon_p_sum = total_day(@mon_order)
    @tue_p_sum = total_day(@tue_order)
    @wed_p_sum = total_day(@wed_order)
    @thu_p_sum = total_day(@thu_order)
    @fri_p_sum = total_day(@fri_order)
    @sat_p_sum = total_day(@sat_order)
    @sun_p_sum = total_day(@sun_order)

    # -------------- actual week-----------------

    @actual_week = Time.now.strftime('%W').to_i
    year = Time.now.year.to_i
    @monday_a = Date.commercial(year, @actual_week, 1)
    @tuesday_a = Date.commercial(year, @actual_week, 2)
    @wednesday_a = Date.commercial(year, @actual_week, 3)
    @thursday_a = Date.commercial(year, @actual_week, 4)
    @friday_a = Date.commercial(year, @actual_week, 5)
    @saturday_a = Date.commercial(year, @actual_week, 6)
    @sunday_a = Date.commercial(year, @actual_week, 7)


    @mon_a_order = []
    @tue_a_order = []
    @wed_a_order = []
    @thu_a_order = []
    @fri_a_order = []
    @sat_a_order = []
    @sun_a_order = []


    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@monday_a.to_s}"
        @mon_a_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@tuesday_a.to_s}"
        @tue_a_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@wednesday_a.to_s}"
        @wed_a_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@thursday_a.to_s}"
        @thu_a_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@friday_a.to_s}"
        @fri_a_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@saturday_a.to_s}"
        @sat_a_order << order
      end
    end

    Order.all.each do |order|
      if order.created_at.to_s.include? "#{@sunday_a.to_s}"
        @sun_a_order << order
      end
    end

    @mon_a_sum = total_day(@mon_a_order)
    @tue_a_sum = total_day(@tue_a_order)
    @wed_a_sum = total_day(@wed_a_order)
    @thu_a_sum = total_day(@thu_a_order)
    @fri_a_sum = total_day(@fri_a_order)
    @sat_a_sum = total_day(@sat_a_order)
    @sun_a_sum = total_day(@sun_a_order)
  end

  def total_day(orders)
    orders.to_a.sum { |order| order.total_price }
  end
end
