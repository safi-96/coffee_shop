# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_ready(order)
    @order = order
    mail(to: order.customer_email, subject: I18n.t('mailer.ready_order', order_id: order.id))
  end
end
