FactoryBot.define do
  factory :item do
    product_name { "Sample Product" }
    product_information { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    price { 1000 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end