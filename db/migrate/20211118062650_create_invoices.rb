class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.datetime :invoice_date
      t.datetime :due_date
      t.string :status
      t.integer :discount
      t.string :total

      t.timestamps
    end
  end
end
