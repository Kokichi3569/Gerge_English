class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :total_payment
      t.integer :status

      t.timestamps
    end
  end
end
