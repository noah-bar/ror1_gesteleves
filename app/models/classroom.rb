class Classroom < ApplicationRecord
  belongs_to :teacher
  has_many :classrooms_students
  has_many :lessons
  has_many :semesters, through: :lessons
  has_many :students, through: :classrooms_students

  def self.active
    current_year = Date.today.year
    where "end_at >= ?", current_year
  end

  def unique_semesters
    semesters.distinct
  end
end
