class Classroom < ApplicationRecord
  belongs_to :teacher
  has_many :students, through: :classrooms_students
end
