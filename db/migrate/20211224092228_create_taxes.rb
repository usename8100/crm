class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.string :name
      t.integer :tax_percent
      
      t.timestamps
    end
  end
end
