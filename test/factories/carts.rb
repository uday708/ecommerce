FactoryBot.define do
  factory :cart do
    user
    total_price { rand(30) }
    total_saving { rand(20) }
  end
end
