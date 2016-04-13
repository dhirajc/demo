class AddPriceToLooks < ActiveRecord::Migration
  def change
    add_column :looks, :price, :string
  end
end
