FactoryBot.define do
  factory :order do
    postal_code {'123-1234'}
    prefecture_id {2}
    city {'札幌'}
    house_number {'琴似1-1'}
    building_name {'第一ビル'}
    tel_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
