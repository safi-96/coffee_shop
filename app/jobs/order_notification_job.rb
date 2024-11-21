class OrderNotificationJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    Order.find(order_id)&.ready!
  end
end
