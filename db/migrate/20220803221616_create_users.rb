class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :is_tutor
      t.boolean :is_accepted, default: false
      t.boolean :is_registered, default: false

      t.timestamps
    end
  end
end
