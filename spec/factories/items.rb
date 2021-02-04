FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.sentence }
    text                { Faker::Lorem.sentence }
    category_id         { Faker::Number.within(range: 2..10) }
    condition_id        { Faker::Number.within(range: 2..8) }
    derivery_date_id    { Faker::Number.within(range: 2..4) }
    shipment_charge_id  { Faker::Number.within(range: 2..3) }
    prefecture_id       { Faker::Number.within(range: 2..48) }
    selling_price    { Faker::Number.number(digits: 6) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/dl-android.png'), filename: 'dl-android.png')
    end
  end
end