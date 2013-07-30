class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :amount
      t.string :ingredient
      t.text :directions
      t.references :recipe, index: true #this is differenct from the book p.140

      t.timestamps
    end
  end
end
