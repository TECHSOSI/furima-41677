FactoryBot.define do
  factory :order_buyer do
    user_id { 1 }
    item_id { 1 }
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    street_address { '1-1' }
    building { '東京ハイツ' }
    telephone { '08011112222' }
  end
end
