class CreateStudyMaterials < ActiveRecord::Migration[8.0]
  def change
    create_table :study_materials do |t|
      t.string :subject, null: false
      t.integer :material_type, default: 0, null: false
      t.string :description
      t.integer :total_duration
      t.integer :time_spent
      t.integer :total_pages
      t.integer :pages_read
      t.integer :position, default: 0, null: false
      t.string :resource_link
      t.timestamps
    end
  end
end