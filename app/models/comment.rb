class Comment < ApplicationRecord
    belongs_to :organization, class_name: "User"
    belongs_to :volunteer, class_name: "User"
    belongs_to :event

    validates :organization_id, :volunteer_id, :event_id, presence: true
    validates :description, length:{minimum: 20}
end
