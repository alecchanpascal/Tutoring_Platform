class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :subject
      t.text :description
      t.integer :cost
      t.datetime :time_of_lesson
      t.references :tutor, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
