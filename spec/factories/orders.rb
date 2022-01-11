FactoryBot.define do
  factory :order do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '品川区' }
    address { '青山1-1-1' }
    building_name { '東京ハイツ101' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end