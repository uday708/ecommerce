FactoryBot.define do
  factory :menu_item do
    name {Faker::Appliance.brand}
    unit_price {rand(20)}
    discount_quantity {rand(3)}
    sale_price {rand(30)}
  end
end
