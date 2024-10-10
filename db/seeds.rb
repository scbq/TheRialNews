# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password123', # O cualquier valor que prefieras
    role: ['admin', 'user'].sample # O asigna los roles que tengas definidos
  )
end

20.times do
  Comment.create(
    content: Faker::Lorem.sentence,
    user_id: User.pluck(:id).sample
  )
end
