class Enrollment < ApplicationRecord
  validates :course_id, uniqueness: { scope: :student_id }

  belongs_to :students,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User

  belongs_to :courses,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course


end
