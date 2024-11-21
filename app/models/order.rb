class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  validates :customer_name, presence: true
end
