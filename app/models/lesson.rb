class Lesson < ApplicationRecord
  belongs_to :classroom
  belongs_to :teacher
  belongs_to :branch
  belongs_to :semester
  has_many :exams
  has_many :students, through: :classroom

  def self.active
    Lesson.joins(:classroom).merge(Classroom.active)
  end

end
