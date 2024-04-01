class Semester < ApplicationRecord
  has_many :lessons

  def self.active
    where('year >= ?', Date.today.year)
  end

  def name
    year.to_s + " - " + number.to_s
  end
end
