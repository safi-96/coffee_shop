module Api
  module V1
    class ItemsController < ApplicationController
      # curl --location 'localhost:3000/api/v1/items?page=2&per_page=5'
      def index
        @items = paginate(Item.all)
      end
    end
  end
end
