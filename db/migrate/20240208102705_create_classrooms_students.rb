class CreateClassroomsStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms_students, id: false do |t|
      t.belongs_to :classroom
      t.belongs_to :student, foreign_key: { to_table: :people }
      t.timestamps
    end
  end
end
