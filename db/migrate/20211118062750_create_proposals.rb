class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.integer :customer_id
      t.text :subject
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.integer :discount
      t.string :total

      t.timestamps
    end
  end
end
