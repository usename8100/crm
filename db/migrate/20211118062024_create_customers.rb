class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.integer :staff_id
      t.integer :customer_role_id
      t.string :name
      t.text :detail_address
      t.string :city
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
