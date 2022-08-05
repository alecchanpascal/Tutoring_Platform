class Enrollment < ApplicationRecord

    #Connects a "student" aliased User to a Lesson
    belongs_to :student, :class_name => "User", optional: true
    belongs_to :lesson

    #Find a way to validate enrollment so that the same user cannot sign up for the same course more than once?
    #Find a way to validate enrollment so that a tutor user cannot sign up for a course?

end
