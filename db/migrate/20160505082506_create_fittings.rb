class CreateFittings < ActiveRecord::Migration
  def change
    create_table :fittings do |t|
      t.integer :height
      t.integer :pant_size
      t.integer :shrit_size
      t.integer :weight
      t.string :shoe_size

      t.timestamps null: false
    end
  end
end
