class Lesson < ApplicationRecord
  belongs_to :classroom
  belongs_to :teacher
  belongs_to :branch
  belongs_to :semester
  has_many :exams
  has_many :students, through: :classroom

  def self.active
    Lesson.joins([:classroom, :branch]).merge(Classroom.active).merge(Branch.active)
  end

  def average_for_student student
    total_weight = 0
    weighted_sum = 0.0
    exams.each do |exam|
      weight = exam.weight || 1
      weighted_sum += (exam.note_for_student(student)&.value || 1.0) * weight
      total_weight += weight
    end
    weighted_sum / (total_weight === 0 ? 1 : total_weight)
  end

end
