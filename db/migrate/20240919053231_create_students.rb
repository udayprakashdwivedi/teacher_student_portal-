class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :subject, null: false
      t.integer :marks, null: false
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
