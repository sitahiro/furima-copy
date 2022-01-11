FactoryBot.define do
  factory :item do
    items_name { '名前' }
    explanation { '説明' }
    price { 2000 }
    category_id { 2 }
    situation_id { 2 }
    cost_id { 2 }
    prefecture_id { 2 }
    days_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima_image.png'), filename: 'fuirma_image.png')
    end
  end
end
