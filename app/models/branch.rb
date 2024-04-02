class Branch < ApplicationRecord
  def self.active
    where('archived = ?', 0)
  end
end
