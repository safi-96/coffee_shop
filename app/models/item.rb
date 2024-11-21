# frozen_string_literal: true

class Item < ApplicationRecord
  # ----------------
  # ENUMS
  # ----------------
  enum category: ::ITEM_CATEGORIES

  # ----------------
  # VALIDATIONS
  # ----------------
  validates :name, :price, :tax_rate, :category, presence: true
end
