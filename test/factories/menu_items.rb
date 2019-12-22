FactoryBot.define do
  factory :menu_item do
    name {Faker::Appliance.brand}
    unit_price {rand(2..20)}
    discount_quantity {rand(2..3)}
    sale_price {rand(10..20)}
  end
end
