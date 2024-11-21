
10.times do
  Item.create(
    name: Faker::Coffee.blend_name,
    price: rand(3.0..7.0).round(2),
    tax_rate: rand(0.05..0.15).round(2),
    category: ::ITEM_CATEGORIES.values.sample
  )
end

# Item.create(name: "Latte", price: 5.00, tax_rate: 0.1, category: :beverage, discount: 0.5)
# Item.create(name: "Sandwich", price: 8.00, tax_rate: 0.08, category: :food, discount: 1.0)
# Item.create(name: "Coffee Mug", price: 10.00, tax_rate: 0.15, category: :merchandise, discount: 2.0)

