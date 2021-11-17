class AddFieldsToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :name, :string
    add_column :accounts, :city, :string
    add_column :accounts, :phone, :string
    add_column :accounts, :age, :integer
  end
end
