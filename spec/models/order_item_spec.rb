# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  # ----------------
  # ASSOCIATIONS
  # ----------------
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:item) }
  end

  # ----------------
  # VALIDATIONS
  # ----------------
  describe 'validations' do
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
  end
end
