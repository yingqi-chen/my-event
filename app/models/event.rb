class Event < ApplicationRecord
    belongs_to :organization, class_name: "User"
    has_many :comments
    has_many :locations
    has_many :volunteers, through: :comments
    accepts_nested_attributes_for :locations
    belongs_to :category


    validates :organization_id, :contact_email, :name, presence: true
    scope :is_free, ->{where(is_free: true)}
    scope :is_finish, ->{ where("end_date < ?", Time.zone.now) }
end
