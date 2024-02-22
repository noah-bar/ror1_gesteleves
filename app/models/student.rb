class Student < Person
  has_many :classrooms, through: :classrooms_students
end