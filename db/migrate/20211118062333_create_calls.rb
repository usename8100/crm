class CreateCalls < ActiveRecord::Migration[6.1]
  def change
    create_table :calls do |t|
      t.integer :customer_id
      t.datetime :date
      t.text :description
      t.integer :staff_id

      t.timestamps
    end
  end
end
