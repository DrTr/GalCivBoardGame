MESSAGES_CONUT = 50

namespace :db do
  desc "Fill database with messages"
  task populate: :environment do
    make_messages
    make_comments
  end
end

def make_messages
  (MESSAGES_CONUT).times do |n|
    title = "Тема №#{n+1}"
    url_title = "update-#{n+1}"
    content = Faker::Lorem.sentence(200)
    Message.create(title: title, url_title: url_title, content: content)
  end
#  Message.first.update(title: "Обновленная новость")
end

def make_comments
  messages = Message.all(limit: 5)

  messages.each do |message| 
    rand(20).times do 
      author = "Автор № #{rand(100)}"
      content = Faker::Lorem.sentence(rand(50))
      message.comments.create(author: author, content: content)
    end
  end
end