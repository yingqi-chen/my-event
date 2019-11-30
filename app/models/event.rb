class Event < ApplicationRecord
    belongs_to :organization, class_name: "User"
    has_many :comments
    has_many :volunteers, through: :comments, source: "Volunteer"

    validates :organization_id, :contact_email, :name, :location, presence: true
    scope :is_free, ->{where(is_free: true)}
end
