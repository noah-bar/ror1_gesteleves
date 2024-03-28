class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.belongs_to :classroom
      t.belongs_to :branch
      t.belongs_to :teacher, foreign_key: { to_table: :people }
      t.timestamps
    end
  end
end
