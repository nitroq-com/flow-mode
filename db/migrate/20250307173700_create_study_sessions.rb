class CreateStudySessions < ActiveRecord::Migration[8.0]
  def change
    create_table :study_sessions do |t|
      t.references :study_material, null: false, foreign_key: true
      t.text :summary
      t.integer :pages_completed, default: 0, null: false
      t.integer :time_spent, default: 0, null: false
      t.boolean :completed, default: false, null: false

      t.timestamps
    end
  end
end
