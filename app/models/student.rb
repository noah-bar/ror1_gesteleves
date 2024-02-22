class Student < Person
  has_many :classrooms_students
  has_many :classrooms, through: :classrooms_students
end