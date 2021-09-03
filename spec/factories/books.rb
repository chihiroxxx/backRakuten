FactoryBot.define do
  factory :book do
    booktitle              {Faker::Book.title}
    thoughts              {Faker::Books::Lovecraft.paragraph}
    association :user
  end
end
