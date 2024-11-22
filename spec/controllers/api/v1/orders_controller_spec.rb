require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do
  describe 'GET #index' do
    let!(:orders) { create_list(:order, 10) }

    it 'returns paginated orders' do
      get :index, params: { page: 1, per_page: 5 }
      expect(assigns(:orders).size).to eq(5)
    end

    it 'returns all orders when pagination params are not provided' do
      get :index
      expect(assigns(:orders).size).to eq(10)
    end
  end

  describe 'POST #create' do
    let!(:item) { create(:item) }
    let(:valid_order_params) do
      {
        order: {
          customer_name: 'John Doe',
          customer_email: 'john.doe@example.com',
          items: [
            { id: item.id, quantity: 2 }
          ]
        }
      }
    end

    before do
      request.headers['CONTENT_TYPE'] = 'application/json'
    end

    it 'creates a new order with valid params' do
      expect {
        post :create, params: valid_order_params
      }.to change(Order, :count).by(1)
    end

    it 'creates order items correctly' do
      post :create, params: valid_order_params

      created_order = Order.last
      expect(created_order.order_items.size).to eq(1)
      expect(created_order.order_items.first.item_id).to eq(item.id)
    end

    it 'returns error with invalid params' do
      invalid_params = { order: { customer_name: '', customer_email: '' } }
      post :create, params: invalid_params

      expect(Order.count).to eq(0)
    end
  end

  describe 'GET #show' do
    let!(:order) { create(:order) }

    it 'returns the order' do
      get :show, params: { id: order.id }
      expect(assigns(:order)).to eq(order)
    end
  end

  describe 'PATCH #update' do
    let!(:order) { create(:order, status: 'initiated') }

    it 'updates the order status to paid' do
      expect {
        patch :update, params: { id: order.id }
        order.reload
      }.to change(order, :status).from('initiated').to('paid')
    end
  end
end
