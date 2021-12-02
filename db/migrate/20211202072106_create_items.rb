class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.integer :tax_id
      t.integer :quantity
      t.string :price
      t.boolean :status

      t.timestamps
    end
  end
end
