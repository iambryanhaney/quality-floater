# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.random = Random.new(42)


    ###
    ### Users
    ###

antonio = User.create(display_name: "Antonio", username: "antonio", password: "12345")
bryan = User.create(display_name: "Bryan Haney", username: "bryan_haney", password: "12345")
noah = User.create(display_name: "Noah Shafer", username: "noah_shafer", password: "12345")
marshall = User.create(display_name: "Marshall", username: "marshall", password: "12345")
# nandita = User.create(display_name: "Nandita", username: "antonio")
cameron = User.create(display_name: "Cameron", username: "cameron", password: "12345")
# ryan = User.create(display_name: "Ryan", username: "antonio")
# alex = User.create(display_name: "Alex", username: "antonio")

20.times do
    temp_name = Faker::Name.unique.name
    User.create(display_name: temp_name, username: temp_name.strip.gsub(' ', "_").downcase, password: "12345")
end



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

cameron.posts.create(title: "On being a supervillain...", content: "It's tough being evil all day. I really feel for the people I destroy.")




    ###
    ### Qualities
    ###

creative = Quality.create(name: "Creative", description: "Inspires a sense of artistic appreciation.")
intelligent = Quality.create(name: "Intelligent", description: "Well informed and logical.")
empathetic = Quality.create(name: "Empathetic", description: "Ability to understand and co-experience the feelings of another.")
dedicated = Quality.create(name: "Dedicated", description: "A focused tenacity.")




    ###
    ### Classifications
    ###

        # Classifying Bryan's posts
Classification.create(user_id: bryan.id, classifier_id: antonio.id, post_id: bryan.posts.first.id, quality_id: creative.id, rating_raw: 1929, rating_weighted: 11.914385132155443)
Classification.create(user_id: bryan.id, classifier_id: noah.id, post_id: bryan.posts.first.id, quality_id: creative.id, rating_raw: 37, rating_weighted: 6.247927513443585)
Classification.create(user_id: bryan.id, classifier_id: marshall.id, post_id: bryan.posts.second.id, quality_id: empathetic.id, rating_raw: 111, rating_weighted: 7.807354922057604)

        # Classifying Cameron's posts
Classification.create(user_id: cameron.id, classifier_id: bryan.id, post_id: cameron.posts.first.id, quality_id: empathetic.id, rating_raw: bryan.quality_rating_raw(empathetic.id), rating_weighted: bryan.quality_rating_weighted(empathetic.id))
Classification.create(user_id: cameron.id, classifier_id: antonio.id, post_id: cameron.posts.first.id, quality_id: empathetic.id, rating_raw: antonio.quality_rating_raw(empathetic.id), rating_weighted: antonio.quality_rating_weighted(empathetic.id))














