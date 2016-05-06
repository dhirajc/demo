class Look < ActiveRecord::Base

belongs_to :product
belongs_to :user
has_many :order_items
has_many :orders, through: :order_items

# def get_total_price(look)

# 	if (params[:look][:neckwear]).present?
# 		n_price = (Accessory.find(params[:look][:neckwear] ).price )
# 		else
# 		n_price = 0
# 	end

# 	if (params[:look][:shirts]).present? 
# 		shirt_price = (Accessory.find(params[:look][:shirts] ).price )
# 	else
# 		shirt_price = 0
# 	end

# 	if (params[:look][:shoes]).present?
# 		shoe_price = (Accessory.find(params[:look][:shoes] ).price )
# 	else
# 		shoe_price = 0
# 	end  

# 	total_price = n_price + shirt_price + shoe_price
# 	raise total_price
# end

end
