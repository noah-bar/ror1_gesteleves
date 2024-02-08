class Student < Person
  has_and_belongs_to_many :classrooms, join_table: :classrooms_students
end