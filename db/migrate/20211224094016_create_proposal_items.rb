class CreateProposalItems < ActiveRecord::Migration[6.1]
  def change
    create_table :proposal_items do |t|
      t.integer :proposal_id
      t.integer :item_id
      t.integer :quantity
      t.string :price
      t.string :amount

      t.timestamps
    end
  end
end
