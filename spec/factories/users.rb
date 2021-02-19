FactoryBot.define do
  factory :user do
    nickname       { 'test太朗' }
    email          { Faker::Internet.email }
    password       { '1q1q1q' }
    password_confirmation { password }
    last_name      { '佐藤' }
    first_name     { '太郎' }
    last_name_kana { 'サトウ' }
    first_name_kana{ 'タロウ' }
    birthday       { Faker::Date.in_date_period }
  end
end
