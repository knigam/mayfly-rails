class InvitesController < ApplicationController
	before_filter :authenticate_user!

	def create
		@event = current_user.events.find(params[:event_id])
		@users = params[:users]
		@users.each do |user_id|
			user = User.find(user_id)
			user.invites.build(:event_id => @event.id, :attending => false)
			user.save
		end
		return render :json => {:success => "true", :event_id => @event.id, :users => @users}
	end

	def update
		@invite = current_user.invites.find(params[:event_id])
		if @invite.update(params[:attending])
			event = @invite.event
			if event.invites.where(attending: true).count == 0
				event.destroy
			return render :json => {:success => "true"}
		else
			return render :json => {:success => "false", :message => "Cannot update invite status"}
		end
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
