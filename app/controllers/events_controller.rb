class EventsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@event = current_user.events.build(event_params)
		if @event.save
		  current_user.invites.build(:event_id => @event.id, :attending => true)
			return render :json => {:success => "true", :event_id => @event.id}
		else
			return render :json => {:success => "false", :message => "Could not save event"}
	  end	
	end
	
	def destroy
		@event = event.find(params[:event_id])
		if @event.destroy
			return render :json => {:success => "true"}
		else
			return render :json => {:success => "false", :message => "Could not destroy event"}
		end
	end

	private
		def event_params
		  params.require(:event).permit(:name, :description, :time, :location, :min, :max)
		end
end
