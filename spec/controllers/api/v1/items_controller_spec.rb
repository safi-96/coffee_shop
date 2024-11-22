require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe 'GET #index' do
    let!(:items) { create_list(:item, 10) }

    it 'returns paginated items' do
      get :index, params: { page: 1, per_page: 5 }

      expect(assigns(:items).size).to eq(5)
    end

    it 'returns all items when pagination params are not provided' do
      get :index

      expect(assigns(:items).size).to eq(10)
    end
  end
end
