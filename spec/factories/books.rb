FactoryBot.define do
  factory :book do
    booktitle              {Faker::Book.title}
    thoughts              {Faker::Books::Lovecraft.sentence}
    association :user
  end
end
