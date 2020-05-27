# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Quality.create(name: "Creative", description: "Inspires a sense of artistic merit.")
# Quality.create(name: "Intelligent", description: "Well informed and logical.")
# Quality.create(name: "Empathetic", description: "Ability to understand and share feelings of another.")

antonio = User.create(name: "Antonio")
bryan = User.create(name: "Bryan Haney")
# noah = User.create(name: "Noah Shafer")

antonio.posts.create(title: "On capitalism...", content: "I think unchecked capitalism sucks for the working man. But no system on paper is ever bad.")
bryan.posts.create(title: "Here's a song I made!", content: "I wrote this. Do you like it?")
# noah.posts << Post.create(title: "On capitalism...", content: "I think unchecked capitalism sucks for the working man. But no system on paper is ever bad.")





