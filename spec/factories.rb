FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    provider "github"
    sequence(:uid)  { |n| n }
    sequence(:link) { |n| "http://fake.link/#{n}" }
    sequence(:image_link) { |n| "http://fake.link/#{n}.jpg" }
  end
  
  factory :comment do
    sequence(:content) { |n| "Lorem ipsum #{n}"}
    user
    message
  end
  
  factory :message do
    sequence(:title) { |n| "Message #{n}" }
    sequence(:url_title) { |n| "message-#{n}" }
    content "Lorem ipsum"
  end
  
  factory :feedback do
    user
    content "Lorem ipsum"
    sequence(:mark) { |n| (n % 5) + 1 }
    sequence(:email) { |n| "fake#{n}@mail.com"} 
  end
end