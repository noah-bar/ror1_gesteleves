class Exam < ApplicationRecord
  belongs_to :lesson
  has_many :students, through: :lesson
  has_many :notes

  validates :name, presence: true
  validates :date, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }

  def note_for_student student
    notes.find_by student: student
  end

end
