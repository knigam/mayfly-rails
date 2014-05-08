class InvitesController < ApplicationController
	before_filter :authenticate_user!

	def create
		if not @event = current_user.events.find(params[:event_id]).where(master: true)
		  return render :json => {:success => "false", :message => "Event not found or user is not master of event"}
		end
		@users = params[:users]
		@users.each do |user_id|
			user = User.find(user_id)
			user.invites.build(:event_id => @event.id, :attending => false, :master => false)
			user.save
		end
		return render :json => {:success => "true", :event_id => @event.id, :users => @users}
	end

	def update
		@invite = current_user.invites.find_by_event_id(params[:event_id])
		@invite.attending = params[:attending]
		if @invite.save
		#if @invite.update(params[:attending])
			#event = @invite.event
			#if event.invites.where(attending: true).count == 0
			#	event.destroy
			#end
			return render :json => {:success => "true"}
		else
			return render :json => {:success => "false", :message => "Cannot update invite status"}
		end
	end

	def show
  	event_list = current_user.invites.map{|i| {id: i.event.id, name: i.event.name, attending: i.attending, creator: i.creator}}
  	return render :json => {:events => event_list}
  end
	
	def destroy
		@invite = current_user.invites.find(params[:event_id])
		if @invite.destroy
			return render :json => {:success => "true"}
		else
			return render :json => {:success => "false", :message => "Could not destroy event"}
		end
	end
end
