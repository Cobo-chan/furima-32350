FactoryBot.define do
  factory :item do
    name                { '石壁' }
    text                { 'インテリアに適した石壁です' }
    category_id         { 2 }
    condition_id        { 2 }
    derivery_date_id    { 2 }
    shipment_charge_id  { 2 }
    prefecture_id       { 2 }
    selling_price    { Faker::Number.number(digits: 6) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/dl-android.png'), filename: 'dl-android.png')
    end
  end
end