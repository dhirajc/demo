class EventsController < ApplicationController

	def index
		@event = Event.where(:user_id => current_user.id)
	end

	def new
		@event = current_user.events.new
	end

	def create
		@event = Event.create(events_params)
		if @event.save
			flash[:notice] = "Event Successfully created"
			redirect_to events_path
		else
			render :new
			flash[:notice] = "Please enter events detail properly"
		end
	end

	private

	def events_params
		params.require(:event).permit(:event_name , :event_date , :user_id)
	end

end
