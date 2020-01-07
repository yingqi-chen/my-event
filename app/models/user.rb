class User < ApplicationRecord
    has_secure_password

    has_many :organized_events, foreign_key: "organization_id", class_name: "Event"
    has_many :commented_comments, foreign_key: "organization_id", class_name: "Comment"
    has_many :being_commented_comments, foreign_key: "volunteer_id", class_name: "Comment"
    has_many :joined_events, through: :being_commented_comments, :source => :event

    validates :name, :email, presence: true

    validates :email, uniqueness: true
    validates :email, confirmation: true
    
    scope :is_organization, -> { where(is_organization: true) }
    scope :is_not_organization, -> { where(is_organization: false) }

   
end
