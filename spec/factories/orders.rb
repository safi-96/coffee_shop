FactoryBot.define do
  factory :order do
    customer_name { "John Doe" }
    customer_email { "john.doe@example.com" }
    total_price { 100.0 }
    status { ::ORDER_STATUSES.keys.sample }

    # Factory association to create associated order_items
    after(:create) do |order|
      create_list(:order_item, 2, order: order)
    end
  end
end
