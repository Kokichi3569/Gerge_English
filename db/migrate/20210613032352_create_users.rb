class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :frist_name_kana
      t.string :email
      t.string :encrypted_password
      t.string :tel_number
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
