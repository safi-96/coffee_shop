class OrdersController < ApplicationController
  def create
    order = Order.new(customer_name: order_params[:customer_name])
    total_price = 0

    order_params[:items].each do |item_param|
      item = Item.find(item_param[:item_id])
      quantity = item_param[:quantity]

      price = (item.price * quantity) * (1 + item.tax_rate)
      discount = item.discount || 0
      total_price += price - discount

      order.order_items.build(
        item: item,
        quantity: quantity,
        price: price,
        discount_applied: discount
      )
    end

    order.total_price = total_price
    order.status = 'pending'

    if order.save
      # Notify after a delay (simulation)
      OrderNotificationJob.set(wait: 5.minutes).perform_later(order.id)
      render json: { order_id: order.id, status: order.status, total_price: total_price }, status: :created
    else
      render json: { error: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    order = Order.includes(:order_items).find(params[:id])
    render json: order.as_json(include: :order_items)
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, items: [:item_id, :quantity])
  end
end
