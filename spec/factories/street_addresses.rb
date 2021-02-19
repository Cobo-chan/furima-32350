FactoryBot.define do
  factory :street_address do
    postcode          { '123-4567' }
    prefecture_id     { 2 }
    municipality      { '横浜' }
    address           { '3-3' }
    optional_address  { 'ハイツ横浜' }
    phone_number      { '09012345678' }

    association    :order
  end
end
