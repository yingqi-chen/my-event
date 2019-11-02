class Comment < ApplicationRecord
    belongs_to :organization, class_name: "User"
    belongs_to :volunteer, class_name: "User"
    belongs_to :event
end
