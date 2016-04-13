class Accessory < ActiveRecord::Base
	has_attached_file :acc_avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :acc_avatar, content_type: /\Aimage\/.*\Z/
    belongs_to :product
end
