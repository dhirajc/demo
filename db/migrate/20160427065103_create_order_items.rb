class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :look_id
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
