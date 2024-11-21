10.times do
  Item.create(
    name: Faker::Coffee.blend_name,
    price: rand(3.0..7.0).round(2),
    tax_rate: rand(0.05..0.15).round(2),
    category: ['Beverage', 'Food', 'Merchandise'].sample,
    discount: [0, 0.5, 1.0].sample
  )
end
