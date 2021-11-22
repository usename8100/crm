class CreateCalls < ActiveRecord::Migration[6.1]
  def change
    create_table :calls do |t|
      t.integer :customer_id
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
