FactoryBot.define do
  factory :cart do
    user
    total_price { rand(2..30) }
    total_saving { rand(3..20) }
  end
end
