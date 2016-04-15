class EventsController < ApplicationController

	def new
		@event = current_user.events.new
	end

end
