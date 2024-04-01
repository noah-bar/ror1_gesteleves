class Student < Person
  has_many :classrooms_students
  has_many :classrooms, through: :classrooms_students
  has_many :lessons, through: :classrooms
  has_many :semesters, through: :lessons

  def current_classroom
    classrooms.order(start_at: :asc).first
  end
end
