class Item < ApplicationRecord
  enum category: ::ITEM_CATEGORIES

  validates :name, :price, :tax_rate, :category, presence: true
end
