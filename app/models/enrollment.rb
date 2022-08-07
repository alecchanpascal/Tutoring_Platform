class Enrollment < ApplicationRecord

    #Connects a "student" aliased User to a Lesson
    belongs_to :student, :class_name => "User", optional: true
    belongs_to :lesson

end
