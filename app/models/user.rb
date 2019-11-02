class User < ApplicationRecord
    has_many :organized_events, foreign_key: "organization_id", class_name: "Event"
    has_many :joined_events, through: :being_commented_comments, foreign_key: "volunteer_id", source:"Event"
    has_many :commented_comments, foreign_key: "organization_id", class_name: "Comment"
    has_many :being_commented_comments, foreign_key: "volunteer_id", class_name: "Comment"
end
