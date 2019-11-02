class Event < ApplicationRecord
    belongs_to :organization, class_name: "User"
    has_many :volunteers, through: :comments, source: "Volunteer"
    has_many :comments
end
