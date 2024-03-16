# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Type.where(name: "Natural").first_or_create
Type.where(name: "Juridica").first_or_create

Position.where(name: "Administrador").first_or_create
Position.where(name: "Obrero").first_or_create
Position.where(name: "Arquitecto").first_or_create
Position.where(name: "Super user").first_or_create

User.where(email: "admin@admin.com").first_or_create do |user|
  user.name = "Admin"
  user.password = "admin"
  user.phone = "1234567890"
  user.identification = "1234567890"
  user.position = Position.where(name: "Super user").first.id
end