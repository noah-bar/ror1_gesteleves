class Semester < ApplicationRecord
  has_many :lessons

  def self.active
    where('year >= ?', Date.today.year)
  end

  def name
    year.to_s + " - " + number.to_s
  end

  def average_for_student student
    lessons_with_exams = lessons.active.select { |lesson| lesson.exams.exists? }

    return 0 if lessons_with_exams.empty?

    average_sum = lessons_with_exams.sum { |lesson| lesson.average_for_student(student) }

    average_sum / lessons_with_exams.length.to_f
  end
end
