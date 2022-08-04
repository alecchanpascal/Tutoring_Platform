class Lesson < ApplicationRecord
  #Links to a User under alias of "tutor"
  belongs_to :tutor, :class_name => "User"

  #Checks that there is a subject, description, cost, and time_of_lesson
  validates :subject, presence: true #uniquness: true?
  validates :description, presence: true #length: {minimum: ?}?
  validates :cost, presence: true, numericality: {greater_than: -1}
  validates :time_of_lesson, presence: true
  #Custom validation to ensure time_of_lesson is possible (set time_of_lesson with DateTime.new(#Year, #Month, #Day, #Hour, #Minute, #Second))
  validate :time_after_creation

  #Link to enrollments table
  has_many :enrollments, dependent: :destroy
  #List of students enrolled in a lesson
  has_many :enrolled_students, through: :enrollments, source: :student

  private

  def time_after_creation
    return unless(time_of_lesson < DateTime.now) 
    errors.add(:time_of_lesson, "time_of_lesson must be after created_at")
  end
end
