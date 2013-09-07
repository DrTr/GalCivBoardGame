# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
MESSAGES_CONUT = 50

  (MESSAGES_CONUT).times do |n|
    title = "Тема №#{n+1}"
    url_title = "update-#{n+1}"
    content = Faker::Lorem.sentence(200)
    Message.create(title: title, url_title: url_title, content: content)
  end
  Message.first.update(title: "Обновленная новость")

  User.create(name: "Dmytro Muravskyi", uid: 117401226043464931259,
              link: "https://plus.google.com/117401226043464931259",
              image_link: "https://lh4.googleusercontent.com/-L3EWythCZmI/AAAAAAAAAAI/AAAAAAAAACE/zQfyH8jI-gY/photo.jpg",
              provider: "google_oauth2")
  User.create(name: "Dmytro Muravskyi", uid: 3704518,
              link: "https://github.com/DrTr",
              image_link: "https://1.gravatar.com/avatar/6a2bce9681003ba17af527dd0cf15dd0?d=https%3A%2F%2Fidenticons.github.com%2Fbcec92f2b6874",
              provider: "github")           


messages = Message.all(limit: 5)
users = User.all
messages.each do |message| 
  rand(20).times do 
    user = users.sample
    content = Faker::Lorem.sentence(rand(50))
    message.comments.create(user_id: user.id, content: content)
  end
end
