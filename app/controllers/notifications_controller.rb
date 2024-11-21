class NotificationsController < ApplicationController
  def index
    orders = Order.where(status: 'ready')
    render json: orders
  end
end
