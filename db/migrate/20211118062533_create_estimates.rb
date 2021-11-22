class CreateEstimates < ActiveRecord::Migration[6.1]
  def change
    create_table :estimates do |t|
      t.integer :customer_id
      t.datetime :estimate_date
      t.datetime :expiry_date
      t.string :status
      t.integer :discount
      t.string :total

      t.timestamps
    end
  end
end
