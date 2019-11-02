class Event < ApplicationRecord
    belongs_to :organization, class_name: "User"
    has_many :volunteers, through: :comments, source: "Volunteer"
    has_many :comments

    validates :organization_id, :contact_email, :name, :location, presence: true
end
