# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    # Ensure deterministic outcome of randomization
Faker::Config.random = Random.new(42)
srand(1000)



    ###
    ### Users
    ###

password = "12345"
antonio = User.create(display_name: "Antonio", username: "antonio", password: password)
bryan = User.create(display_name: "Bryan Haney", username: "bryan_haney", password: password)
noah = User.create(display_name: "Noah Shafer", username: "noah_shafer", password: password)
marshall = User.create(display_name: "Marshall", username: "marshall", password: password)
nandita = User.create(display_name: "Nandita", username: "nandita", password: password)
cameron = User.create(display_name: "Cameron", username: "cameron", password: password)
ryan = User.create(display_name: "Ryan", username: "ryan", password: password)
alex = User.create(display_name: "Alex", username: "alex", password: password)

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

    # Random posts with Silicon Valley content
17.times do
    user = User.all.sample
    user.posts.create(title: Faker::Company.unique.bs.titleize, content: Faker::TvShows::SiliconValley.unique.quote)
end

    # Random posts with Rick And Morty content
52.times do
    user = User.all.sample
    user.posts.create(title: Faker::Company.unique.bs.titleize, content: Faker::TvShows::RickAndMorty.unique.quote)
end




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
antonio.classify_post(bryan.posts.first, Quality.find_by(name: "Creative").id)
noah.classify_post(bryan.posts.first, Quality.find_by(name: "Creative").id)
marshall.classify_post(bryan.posts.second, Quality.find_by(name: "Empathetic").id)

        # Classifying Cameron's post
bryan.classify_post(cameron.posts.first, Quality.find_by(name: "Empathetic").id)

        # Random classifications (with deterministic outcome)
500.times do
    classifier = User.all.sample # Random user
    post = Post.all.where.not(user_id: classifier.id).sample # Random post that does not belong to user
    quality = Quality.all.sample # Random quality
    classifier.classify_post(post, quality.id)
end

















