class User < ApplicationRecord
  validates :name, presence: true

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :taught_courses,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :Course

  has_many :courses_taking,
    through: :enrollments,
    source: :courses
end
