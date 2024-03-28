class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :weight
      t.date :date
      t.belongs_to :lesson
      t.timestamps
    end
  end
end
