class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :body
      t.boolean :published, default: false
      t.references :student, index: true, foreign_key: {to_table: :users}
      t.references :tutor, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
