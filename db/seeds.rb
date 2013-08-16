# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless Rails.env.production?
  user = User.where(email: "user@example.com").first_or_create(
                    email: "user@example.com",
                 password: "password",
    password_confirmation: "password",
  )

  user2 = User.where(email: "user2@example.com").first_or_create(
                    email: "user2@example.com",
                 password: "password",
    password_confirmation: "password",
  )


end