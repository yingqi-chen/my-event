class Comment < ApplicationRecord
    validate :comment_made_by_organization, on: [:create, :update]
    validate :comment_on_volunteer, on: [:create, :update]
    validate :cant_comment_on_oneself, on: [:create, :update]

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

     def cant_comment_on_oneself
        if self.organization = self.volunteer
            errors.add(:organization_id, "cannot comment on yourself.")
        end
     end
end
