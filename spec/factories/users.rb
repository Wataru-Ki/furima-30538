FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password  =  Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name            {"渉"}
    family_name           {"北野"}
    first_name_kana       {"ワタル"}
    family_name_kana      {"キタノ"}
    birth_day             {"2020/10/06"}
  end
end