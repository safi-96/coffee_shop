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

        # Fetch all items in a single query
        item_ids = order_params[:items].map { |item_param| item_param[:id] }
        items = Item.where(id: item_ids).index_by(&:id)

        order_params[:items].each do |item_param|
          item = items[item_param[:id]]
          quantity = item_param[:quantity]
          base_price = item.price * (1 + item.tax_rate.to_f)

          # Rule 1: Buy 2, get 10% off the third
          rule_1_discount = (quantity / 3) * base_price * 0.1

          # Rule 2: Buy 3, get 1 free
          rule_2_discount = (quantity / 4) * base_price
          total_discount = rule_1_discount + rule_2_discount
          item_total_price = (base_price * quantity) - total_discount
          total_price += item_total_price

          order.order_items.build(
            item_id: item.id,
            quantity: quantity,
            price: item_total_price
          )
        end

        [order, total_price]
      end
    end
  end
end
