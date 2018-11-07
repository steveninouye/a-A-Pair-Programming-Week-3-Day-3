class Course < ApplicationRecord
  validates :instructor_id, presence: true
  validates :name, presence: true, uniqueness: true

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User

  #joins
  has_many :students,
    through: :enrollments,
    source: :students

  # self joins
  has_many :next_course,
    class_name: :Course,
    foreign_key: :prereq_id,
    primary_key: :id


  belongs_to :pre_req,
    class_name: :Course,
    foreign_key: :prereq_id,
    primary_key: :id,
    optional: true
end
