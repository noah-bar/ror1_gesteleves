class CreateSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :semesters do |t|
      t.integer :year
      t.integer :number
      t.timestamps
    end
    
    change_table :lessons do |t|
      t.belongs_to :semester
    end
  end
end
