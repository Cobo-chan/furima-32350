FactoryBot.define do
  factory :user do
    nickname       { Faker::Lorem.sentence }
    email          { Faker::Internet.email }
    password       { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name      { '佐藤' }
    first_name     { '太郎' }
    last_name_kana { 'サトウ' }
    first_name_kana{ 'タロウ' }
    birthday       { Faker::Date.in_date_period }
  end
end
