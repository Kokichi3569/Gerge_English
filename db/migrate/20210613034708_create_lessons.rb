class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :date
      t.string :lesson_name
      t.integer :price
      t.text :introduction
      t.string :image_id
      t.boolean :is_active

      t.timestamps
    end
  end
end
