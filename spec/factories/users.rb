FactoryBot.define do
  factory :user do
    nickname              {"tadashi"}
    email                 {"tadasi@gmail.com"}
    password              {"1qaz2wsx"}
    password_confirmation {"1qaz2wsx"}
    first_name            {"吉村"}
    last_name             {"匡史"}
    first_name_kana       {"ヨシムラ"}
    last_name_kana        {"タダシ"}
    phone_number          {"080-0000-1111"}
  end
end