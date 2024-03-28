class Exam < ApplicationRecord
  belongs_to :lesson
  has_many :students, through: :lesson
  has_many :notes

  def note_for_student student
    notes.find_by student: student
  end
end
