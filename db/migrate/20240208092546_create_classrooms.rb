class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :start_at
      t.integer :end_at
      t.belongs_to :teacher, foreign_key: { to_table: :people }
      t.timestamps
    end
  end
end
