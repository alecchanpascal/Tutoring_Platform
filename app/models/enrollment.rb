class Enrollment < ApplicationRecord
    belongs_to :student, :class_name => "User", optional: true
    belongs_to :lesson

end
