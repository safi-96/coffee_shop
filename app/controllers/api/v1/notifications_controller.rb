module Api
  module V1
    class NotificationsController < ApplicationController
      def index
        @orders = paginate(Order.ready)
      end
    end
  end
end
