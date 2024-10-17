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
User.destroy_all
Post.destroy_all
Reaction.destroy_all
Comment.destroy_all

# Crear usuarios
i = 0
until User.count == 20 do
  User.create(email: "test#{i}@gmail.com", password: "asdasdasd", password_confirmation: "asdasdasd", photo: Faker::Avatar.image, name: Faker::Name.name)
  i += 1
end

# Crear publicaciones
users = User.all
until Post.count == 100 do
  Post.create(title: Faker::Book.title, content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), user: users.sample)
end

# Crear comentarios
posts = Post.all
until Comment.count == 1000 do
  Comment.create(content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), post: posts.sample, user: users.sample, anonymous: [true, false].sample)
end

# Crear reacciones
r_type = %w[article comment]
comments = Comment.all
kinds = Reaction::Kinds

until Reaction.count == 1000 do
  rel_type = r_type.sample
  if rel_type == "article"
    Reaction.create(post: posts.sample, user: users.sample, kind: kinds.sample, reaction_type: rel_type, comment: nil)
  else
    Reaction.create(comment: comments.sample, user: users.sample, kind: kinds.sample, reaction_type: rel_type, post: nil)
  end
end
