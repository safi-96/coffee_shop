module Api
  module V1
    class ItemsController < ApplicationController
      def index
        items = Item.all
        render json: items
      end
    end
  end
end
