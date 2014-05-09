class EventsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@event = current_user.events.build(event_params)
		
		# set the time
		time = params[:time]
		d = /:/ =~ time
		hour = time[0... d]
		min = time[d + 1 .. -1]
		@event.time = Time.new.change(hour: hour, min: min)

		if @event.save
		  invite = current_user.invites.build(:event_id => @event.id, :attending => true, :creator => true)
			invite.save
			return render :json => {:success => true, :event_id => @event.id}
		else
			return render :json => {:success => false, :message => "Could not save event"}
	  end	
	end
	
	def destroy
		@event = current_user.events.find(params[:event_id])
		if @event.destroy
			return render :json => {:success => "true"}
		else
			return render :json => {:success => "false", :message => "Could not destroy event"}
		end
	end

	def show
		i = current_user.invites.find_by_event_id(params[:event_id])
	  e = i.event
		users_attending = e.users.map{|o| {id: o.id, name: o.name}}
		return render :json => {id: e.id, name: e.name, description: e.description, time: e.time, location: e.location, min: e.min, max: e.max, attending: i.attending, creator: i.creator, users_attending: users_attending}
	end

	private
		def event_params
		  params.require(:event).permit(:name, :description, :location, :min, :max)
		end
end
