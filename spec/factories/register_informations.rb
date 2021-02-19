FactoryBot.define do
  factory :register_information do
    postcode            { '123-4567' }
    municipality        { '函館' }
    prefecture_id       { 2 }
    address             { '3-3' }
    optional_address    { '函館ハイツ' }
    phone_number        { '09012345678' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
