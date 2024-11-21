# frozen_string_literal: true

class OrderNotificationJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    order.ready!
    OrderMailer.order_ready(order).deliver_later
  end
end
