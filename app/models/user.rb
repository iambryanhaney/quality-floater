class User < ApplicationRecord
    has_secure_password
    has_many :user_qualities
    has_many :qualities, through: :user_qualities
    validates :username, uniqueness: {message: "That username is already taken"}
    validate :validate_username_length

    has_many :posts

    # Classifications of users who have classified your posts
        # returns - A collection Classification objects
    has_many :classifications_received, class_name: "Classification"

    # Classifications you have made for other users posts
        # returns - A collection Classification objects
    has_many :classifications_made, foreign_key: :classifier_id, class_name: "Classification"

    # Users you have classified posts for 
        # returns - A collection User objects
    #has_many :classified_users, through: :classifications_made, source: :user

    # A User's rating for a specific quality
    #has_many :quality_ratings, -> { group 'quality_id' }, class_name: "Classification"

    # Return the raw and weighted values of a user's quality
    def quality_rating_raw(quality_id)
        self.classifications_received.where(quality_id: quality_id, active: true).sum(:rating_weighted)
    end

    def quality_rating_weighted(quality_id)
        Math.log2(1 + self.quality_rating_raw(quality_id)) + 1
    end

    def classifiers_quality_average_raw(quality_id)
        self.classifications_received.where(quality_id: quality_id, active: true).average(:rating_raw).to_f
    end

    def classifiers_quality_average_weighted(quality_id)
        weighted_average = self.classifications_received.where(quality_id: quality_id, active: true).average(:rating_weighted).to_f
    end

    def classify_post(post, quality_id)
        if post.user.id == self.id
            puts "Can't classify your own posts!"
            return
        end

        classification = self.classifications_made.find_by(post_id: post.id, quality_id: quality_id)
        if classification
            classification.update(active: true)
        else
            self.classifications_made.create(user_id: post.user.id, post_id: post.id, quality_id: quality_id, rating_raw: self.quality_rating_raw(quality_id), rating_weighted: self.quality_rating_weighted(quality_id))
        end
    end

    def declassify_post(post, quality_id)
        if post.user.id == self.id
            puts "Can't declassify your own posts!"
            return
        end

        classification = self.classifications_made.find_by(post_id: post.id, quality_id: quality_id)
        classification.update(active: false) if classification
    end


    
    def get_user(id:)
        User.find(id)
    end

    private 
    def validate_username_length
        if self.username.length < 6 || self.username.length > 30
            errors.add(:username, "Username must be between 6 and 30 characters")
        elsif self.username.include? " "
            errors.add(:username, "Username cannot contain spaces")
        end
    end
end














