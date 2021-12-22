class AddContactIdToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :contact_id, :integer
  end
end
