FactoryBot.define do
  factory :cart_item do
    menu_item
    cart
    quantity {rand(1..3)}
  end
end
