class Fitting < ActiveRecord::Base
	validates :height, presence: true
	validates :pant_size, presence: true
	validates :weight, presence: true
	validates :shrit_size, presence: true
	validates :shoe_size, presence: true
end
