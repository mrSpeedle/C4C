# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Limpia la base de datos antes de poblarla
# Crear usuarios

require 'faker'
i = 0
until User.count == 20 do
  User.create(
    email: "test#{i}@gmail.com", 
    password: "asdasdasd", 
    password_confirmation: "asdasdasd"
  )
  i += 1
end

# Crear publicaciones
users = User.all
until Publication.count == 100 do
  Publication.create(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    photo: Faker::Avatar.image,
    user: users.sample
  )
end

# Crear comentarios
publications = Publication.all
until Comment.count == 1000 do
  Comment.create(
    content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    publication: publications.sample,
    user: users.sample
  )
end

# Crear reacciones (simplificadas)
comments = Comment.all
until Reaction.count == 1000 do
  Reaction.create(
    like: [true, false].sample.to_s, 
    dislike: [true, false].sample.to_s
  )
end

