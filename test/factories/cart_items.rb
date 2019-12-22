FactoryBot.define do
  factory :cart_item do
    menu_item
    cart
    quantity {rand(3)}
  end
end
