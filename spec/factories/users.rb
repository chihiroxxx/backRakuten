FactoryBot.define do
  factory :user do
    name              {Faker::Internet.password(min_length: 6, mix_case: false)}
    password              {Faker::Number.leading_zero_number(digits: 8)}
  end
end
