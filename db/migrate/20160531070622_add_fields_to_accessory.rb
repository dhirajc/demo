class AddFieldsToAccessory < ActiveRecord::Migration
  def change
    add_column :accessories, :quantity, :string
  end
end
