# frozen_string_literal: true

class Order < ApplicationRecord
  # ----------------
  # ASSOCIATIONS
  # ----------------
  has_many :order_items, dependent: :destroy

  # ----------------
  # ENUMS
  # ----------------
  enum :status, ::ORDER_STATUSES

  # ----------------
  # VALIDATIONS
  # ----------------
  validates :customer_name, presence: true
end
