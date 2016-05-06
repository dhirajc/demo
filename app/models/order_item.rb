class OrderItem < ActiveRecord::Base
	belongs_to :look
	belongs_to :order
end
