FactoryBot.define do
  factory :item do
   title {'テスト'}
   explanation {'テストです'}
   category_id {2}
   situation_id {2}
   delivery_id {2}
   prefecture_id {2}
   shipping_id {2}
   price {1000}
   association :user

   
   after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
  end
end
