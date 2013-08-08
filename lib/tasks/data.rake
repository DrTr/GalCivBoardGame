namespace :db do
  desc "Fill database with messages"
  task populate: :environment do
    make_messages
  end
end

def make_messages
  50.times do |n|
    title = "Тема №#{n}"
    url_title = "update-#{n}"
    content = Faker::Lorem.sentence(200)
    Message.create(title: title, url_title: url_title, content: content)
  end
end