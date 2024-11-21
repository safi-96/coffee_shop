# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_ready(order)
    @order = order
    mail(to: order.customer_email, subject: "Your order ##{order.id} is ready!")
  end
end
