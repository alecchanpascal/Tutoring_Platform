class Lesson < ApplicationRecord
    belongs_to :tutor, :class_name => "User"

    #Link to enrollments table
    has_many :enrollments, dependent: :destroy
    #List of students enrolled in a lesson
    has_many :enrolled_students, through: :enrollments, source: :student
end
