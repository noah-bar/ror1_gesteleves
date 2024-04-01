class Teacher < Person
  has_many :classrooms
  enum :role, { teacher: 0, dean: 1 }
end
