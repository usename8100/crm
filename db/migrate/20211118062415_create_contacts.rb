class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :customer_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :designation
      t.text :notes

      t.timestamps
    end
  end
end
