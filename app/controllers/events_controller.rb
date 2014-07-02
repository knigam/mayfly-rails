class EventsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@event = current_user.events.build(event_params)
		
		# get time values
		start_time = params[:start_time]
		end_time = params[:end_time]

		# set start time
		d = /:/ =~ start_time
		hour = start_time[0... d].to_i
		min = start_time[d + 1 .. -1].to_i

		@event.start_time = Time.new.change(hour: hour, min: min)
		
		# set end time
		d = /:/ =~ end_time
		hour = end_time[0... d].to_i
		min = end_time[d + 1 .. -1].to_i
		@event.end_time = Time.new.change(hour: hour, min: min)
		if @event.end_time < @event.start_time
			@event.end_time += 1.day
		end
		
		if @event.start_time < DateTime.now
			@event.start_time += 1.day
			@event.end_time += 1.day
		end

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
			return render :json => {:success => true}
		else
			return render :json => {:success => false, :message => "Could not delete event"}
		end
	end

	def show
		i = current_user.invites.find_by_event_id(params[:event_id])
	  e = i.event
		if e.end_time < Time.now
			e.active = false
			e.save
		end
		users_attending = Invite.where(event_id: e.id, attending: true).map{|o| {id: o.user.id, name: o.user.name}}
		return render :json => {active: e.active, id: e.id, name: e.name, description: e.description, start_time: e.start_time.to_s(:custom), end_time: e.end_time.to_s(:custom), location: e.location, min: e.min, max: e.max, attending: i.attending, creator: i.creator, open: e.open, users_attending: users_attending}
	end

	private
		def event_params
		  params.require(:event).permit(:name, :description, :location, :min, :max, :open)
		end
end
