# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Clearing all data for testing
User.destroy_all
Gallery.destroy_all
Photo.destroy_all

# Making a user
user = User.create!(
  email: "test@gmail.com",
  password: "password",
)


#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
