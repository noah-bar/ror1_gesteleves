class ClassroomsStudent < ApplicationRecord
  belongs_to :classroom
  belongs_to :student

end
