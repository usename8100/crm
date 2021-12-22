class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :customer_id
      t.datetime :date
      t.text :subject
      t.text :content
      t.integer :contact_id

      t.timestamps
    end
  end
end
