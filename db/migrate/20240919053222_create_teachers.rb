class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :teachers, :email, unique: true
  end
end
