class Comment < ApplicationRecord

    validates :organization_id, :volunteer_id, :event_id, presence: true
    validates :content, length:{minimum: 20}


    belongs_to :organization, class_name: "User"
    belongs_to :volunteer, class_name: "User"
    belongs_to :event


    
end
