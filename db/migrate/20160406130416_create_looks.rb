class CreateLooks < ActiveRecord::Migration
  def change
    create_table :looks do |t|
      t.string :name
      t.string :neckwear
      t.string :shirts
      t.string :shoes

      t.timestamps null: false
    end
  end
end
