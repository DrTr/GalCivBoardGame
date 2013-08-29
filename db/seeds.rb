# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
MESSAGES_CONUT = 50

make_messages
make_comments

def make_messages
  (MESSAGES_CONUT).times do |n|
    title = "Тема №#{n+1}"
    url_title = "update-#{n+1}"
    content = Faker::Lorem.sentence(200)
    Message.create(title: title, url_title: url_title, content: content)
  end
  Message.first.update(title: "Обновленная новость")
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