# frozen_string_literal: true

class Item < ApplicationRecord
  # ----------------
  # ASSOCIATIONS
  # ----------------
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  # ----------------
  # ENUMS
  # ----------------
  enum category: ::ITEM_CATEGORIES

  # ----------------
  # VALIDATIONS
  # ----------------
  validates :name, :price, :tax_rate, :category, presence: true
end
