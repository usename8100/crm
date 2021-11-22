class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.integer :user_id
      t.string :designation

      t.timestamps
    end
  end
end
