class Order < ActiveRecord::Base
	has_many :order_items
	has_many :looks, through: :order_items
	belongs_to :user
end
