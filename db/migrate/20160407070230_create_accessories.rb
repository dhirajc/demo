class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :acc_name
      t.string :variant
      t.references :product_id, index: true, foreign_key: true
      t.integer :price

      t.timestamps null: false
    end
  end
end
