class ClassroomsStudent < ApplicationRecord
  enum status: [:completed, :cancelled, :failed, :in_progress]

  belongs_to :classroom
  belongs_to :student

end
