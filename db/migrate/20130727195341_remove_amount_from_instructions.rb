class RemoveAmountFromInstructions < ActiveRecord::Migration
  def change
    remove_column :instructions, :amount, :string
  end
end
