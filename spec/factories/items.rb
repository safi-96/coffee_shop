FactoryBot.define do
  factory :item do
    name { "Sample Item" }
    price { 10.0 }
    tax_rate { 0.1 }
    category { ::ITEM_CATEGORIES.keys.sample }
  end
end
