FactoryBot.define do
  factory :order_item do
    association :order
    association :item
    quantity { 2 }
    price { 20.0 }
  end
end
