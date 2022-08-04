class Review < ApplicationRecord
    #Connects a "student" aliased User and a "tutor" aliased User
    belongs_to :student, :class_name => "User"
    belongs_to :tutor, :class_name => "User"

    #Ensures there is a rating between 1 and 5 and that there is a body/description of some kind
    validates :rating, presence: true, numericality: {greater_than: 0, less_than: 6}
    validates :body, presence: true, length: {minimum: 15} #I don't know what to set the character minimum to or if this is even necessary tbh
end