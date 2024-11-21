module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = paginate(Order.all)
      end

      def create
        order = Order.new(customer_name: order_params[:customer_name],
                          customer_email: order_params[:customer_email]
                        )
        order, total_price = build_order_items(order)
        order.total_price = total_price
        order.status = ORDER_STATUSES[:initiated]
        order.save!
      end

      def show
      end

      def update
        @order.paid!
        OrderNotificationJob.set(wait: 5.minutes).perform_later(@order.id)
      end

      private

      def set_order
        @order = Order.find(params[:id])
      end
      def order_params
        params.require(:order).permit(:customer_name, :customer_email, items: [:item_id, :quantity])
      end

      def build_order_items(order)
        total_price = 0
        order_params[:items].each do |item_param|
          item = Item.find(item_param[:item_id])
          quantity = item_param[:quantity]
          price = (item.price * quantity) * (1 + item.tax_rate.to_f)
          total_price += price * (1 - (item.discount_percentage.to_f / 100.0))

          order.order_items.build(
            item_id: item.id,
            quantity: quantity,
            price: price
          )
        end

        order, total_price
      end
    end
  end
end
