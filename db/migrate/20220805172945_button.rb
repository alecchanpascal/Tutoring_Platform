class Button < ActiveRecord::Migration[7.0]
  def change
    create_table :button do |t|
      t.integer :clicks
      t.timestamps
    end
  end
end
