class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.integer :customer_id
      t.text :content

      t.timestamps
    end
  end
end
