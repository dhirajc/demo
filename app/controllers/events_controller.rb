class EventsController < ApplicationController


	def new
		@event = current_user.events.new
		@events = Event.where(:user_id => current_user.id)
	end

	def create
		@event = Event.create(events_params)
		if @event.save
			flash[:notice] = "Event Successfully created"
			redirect_to :back
		else
			render :new
			flash[:notice] = "Please enter events detail properly"
		end
	end

	def edit
		@event = Event.find(params[:id])
		@events = Event.where(:user_id => current_user.id)
	end

	def update
		@event = Event.find(params[:id])
			if @event.update_attributes(events_params)
				flash[:notice] = 'Successfully updated'
				redirect_to new_event_path
			else
				render 'edit'
			end
	end

	def invite
		@email1 = params[:email1]
		@email2 = params[:email2]
		UserMailer.send_invite(@email1,@email2).deliver
		redirect_to :back
	end

	private

	def events_params
		params.require(:event).permit(:event_name , :event_date , :user_id)
	end

end
