# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




    ###
    ### Users
    ###

antonio = User.create(name: "Antonio")
bryan = User.create(name: "Bryan Haney")
noah = User.create(name: "Noah Shafer")
marshall = User.create(name: "Marshall")
nandita = User.create(name: "Nandita")
cameron = User.create(name: "Cameron")
ryan = User.create(name: "Ryan")
alex = User.create(name: "Alex")




    ###
    ### Posts
    ###

antonio.posts.create(title: "Coding is Life", content: "When I'm not thinking about coding, I'm thinking about coding.")
antonio.posts.create(title: "An elegant solution", content: "Here's a way to bend ActiveRecord to your will.")

bryan.posts.create(title: "Here's a song I made!", content: "I wrote this. Do you like it?")
bryan.posts.create(title: "Our dysfunctional criminal justice system", content: "POC are disproportionately targetted and harshly sentenced for petty crimes. We have two systems.")
bryan.posts.create(title: "Women's rights", content: "Women have only been deemed fit to vote for 100 years in America. And they're still fighting for ownership of their bodies.")

noah.posts.create(title: "On capitalism...", content: "I think unchecked capitalism sucks for the working man. But no system on paper is ever bad.")
noah.posts.create(title: "A little music for you...", content: "Here's a track I produced.")




    ###
    ### Qualities
    ###

Quality.create(name: "Creative", description: "Inspires a sense of artistic appreciation.")
Quality.create(name: "Intelligent", description: "Well informed and logical.")
Quality.create(name: "Empathetic", description: "Ability to understand and co-experience the feelings of another.")
Quality.create(name: "Dedicated", description: "A focused tenacity.")




    ###
    ### Classifications
    ###

c = Classification.create(user_id: antonio.id, classifier_id: bryan.id, post_id: antonio.posts.first.id, quality_id: Quality.first.id, rating_snapshot: 999)
binding.pry












