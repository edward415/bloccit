class Post < ActiveRecord::Base
    # t.string   "title"
    # t.text     "body"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.integer  "user_id"
    # t.integer  "topic_id"
    # t.string   "picture"
    # t.float    "rank"

    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    belongs_to :user
    belongs_to :topic
    mount_uploader :picture, ImageUploader
    
    default_scope { order('rank DESC') }
    
    validates :title, length: {minimum: 5 }, presence: true
    validates :body, length: {minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
    
    
    def up_votes
        votes.where(value: 1).count
    end
    
    def down_votes
        votes.where(value: -1).count
    end
    
    def points
        [up_votes, down_votes * -1].sum
    end
        
    
    def update_rank
        age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24)
        new_rank = points + age_in_days
        
        update_attribute(:rank, new_rank)
    end
    
    
    def create_vote
        user.votes.create(value:1, post: self)
    end
    
    def save_with_initial_vote
      transaction do
        save
        create_vote
      end
    end
      
    
end
