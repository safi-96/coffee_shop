module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_order, only: [:show, :update]

      def index
        @orders = paginate(Order.all)
      end

      def create
        order = Order.new(
          customer_name: order_params[:customer_name],
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
        # As per the requirements we do not have to handle the payments etc,
        # If we had, we could have managed them here with the actual amount paid.

        @order.paid!
        OrderNotificationJob.set(wait: 5.minutes).perform_later(@order.id)
      end

      private

      def set_order
        @order = Order.find(params[:id])
      end

      def order_params
        params.require(:order).permit(:customer_name, :customer_email, items: [:id, :quantity])
      end

      def build_order_items(order)
        total_price = 0
        order_params[:items].each do |item_param|
          item = Item.find(item_param[:id])
          quantity = item_param[:quantity]
          price = (item.price * quantity) * (1 + item.tax_rate.to_f)
          total_price += price

          order.order_items.build(
            item_id: item.id,
            quantity: quantity,
            price: price
          )
        end

        [ order, total_price ]
      end
    end
  end
end
