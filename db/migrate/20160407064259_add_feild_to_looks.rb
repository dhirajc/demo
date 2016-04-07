class AddFeildToLooks < ActiveRecord::Migration
  def change
    add_column :looks, :product_id, :integer
  end
end
