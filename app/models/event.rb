class Event < ApplicationRecord
    belongs_to :organization, class_name: "User"
    has_many :volunteers, through: :comments, source: :volunteer
    has_many :comments
end
