module Api
  module V1
    class NotificationsController < ApplicationController
      def index
        orders = Order.where(status: 'ready')
        render json: orders
        end
    end
  end
end
