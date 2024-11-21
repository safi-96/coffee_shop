# frozen_string_literal: true

class OrderItem < ApplicationRecord
  # ----------------
  # ASSOCIATIONS
  # ----------------
  belongs_to :order
  belongs_to :item
end
