module UsersHelper

    def is_organization_field?(user,comments)
        if user.is_organization 
          "As an organization, #{user.name} makes #{comments.size} comment(s)" 
        else
          "As an volunteer, #{user.name} receives #{comments.size} comment(s)" 
        end 
    end

end


