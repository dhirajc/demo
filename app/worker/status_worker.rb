class StatusWorker
	include Sidekiq::Worker

	def perform
		@order = Order.find(order)
		UserMailer.status_email(@order).delver_now
	end
end