class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_date

      t.timestamps null: false
    end
  end
end
