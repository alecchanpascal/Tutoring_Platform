class User < ApplicationRecord

    has_secure_password

    #Checks for username and email and makes sure email is unique and of the right format
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :username, presence: true
    validates :email, presence: true, uniqueness: {case_sensitive: false}, format: VALID_EMAIL_REGEX

    #Link to enrollments table
    has_many :enrollments, :foreign_key => "student_id"
    #List of lessons a student is enrolled in
    has_many :enrolled_courses, through: :enrollments, source: :lesson

    #List of lessons a tutor is teaching
    has_many :lessons, :foreign_key => "tutor_id", dependent: :destroy

    #Reviews from students
    has_many :reviews_by, :class_name => "Review", :foreign_key => "student_id"
    #Reviews for tutors
    has_many :reviews_for, :class_name => "Review", :foreign_key => "tutor_id"

    #Enables User.tutors
    scope :tutors, -> {where(is_tutor:true)}

end
