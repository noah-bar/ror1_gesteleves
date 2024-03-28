class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.decimal :value
      t.belongs_to :exam
      t.belongs_to :student, foreign_key: { to_table: :people }
      t.timestamps
    end
  end
end
