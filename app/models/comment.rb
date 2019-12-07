class Comment < ApplicationRecord
    validate :comment_made_by_organization, on: :create
    validate :comment_on_volunteer, on: :create
    validates :organization_id, :volunteer_id, :event_id, presence: true
    validates :content, length:{minimum: 20}


    belongs_to :organization, class_name: "User"
    belongs_to :volunteer, class_name: "User"
    belongs_to :event


    

    def comment_made_by_organization
       unless self.organization.is_organization
        errors.add(:organization_id, "has to be of an organization.")
       end
    end

    def comment_on_volunteer
        if self.volunteer.is_organization
            errors.add(:volunteer_id, "has to be of an volunteer")
        end
    end
end
