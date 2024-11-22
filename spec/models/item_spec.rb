# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  # ----------------
  # ASSOCIATIONS
  # ----------------
  describe 'associations' do
    it { should have_many(:order_items).dependent(:destroy) }
    it { should have_many(:orders).through(:order_items) }
  end

  # ----------------
  # ENUMS
  # ----------------
  describe 'enums' do
    it "defines the expected categories" do
      expect(Item.categories.keys).to match_array(::ITEM_CATEGORIES.keys.map(&:to_s))
    end
  end

  # ----------------
  # VALIDATIONS
  # ----------------
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:tax_rate) }
    it { should validate_presence_of(:category) }
  end
end
