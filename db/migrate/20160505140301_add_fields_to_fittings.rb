class AddFieldsToFittings < ActiveRecord::Migration
  def change
    add_column :fittings, :look_id, :integer
    add_column :fittings, :user_id, :integer
  end
end
