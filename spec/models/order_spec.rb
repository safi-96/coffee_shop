# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  # ----------------
  # ASSOCIATIONS
  # ----------------
  describe 'associations' do
    it { is_expected.to have_many(:order_items).dependent(:destroy) }
    it { is_expected.to have_many(:items).through(:order_items) }
  end

  # ----------------
  # ENUMS
  # ----------------
  describe 'enums' do
    it "defines the expected statuses" do
      expect(Order.statuses.keys).to match_array(::ORDER_STATUSES.keys.map(&:to_s))
    end
  end

  # ----------------
  # VALIDATIONS
  # ----------------
  describe 'validations' do
    it { is_expected.to validate_presence_of(:customer_name) }
    it { is_expected.to validate_presence_of(:customer_email) }
  end
end
