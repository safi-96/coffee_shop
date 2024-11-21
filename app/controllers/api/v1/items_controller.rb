module Api
  module V1
    class ItemsController < ApplicationController
      def index
        @items = paginate(Item.all)
      end
    end
  end
end
