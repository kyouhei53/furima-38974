FactoryBot.define do
  factory :item do
   title {'テスト'}
   explanation {'テストです'}
   category_id {2}
   situation_id {2}
   delivery_id {2}
   prefecture_id {2}
   send_id {2}
  end
end
