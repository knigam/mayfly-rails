class InvitesController < ApplicationController
#	before_filter :authenticate_user!

	def create
		@event = Event.find(params[:event_id])
		#Go through loop in :users
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
		if @invite.update(invite_params)
			return render :json => {:success => "true"}
		else
			return render :json => {:success => "false", :message => "Cannot update invite status"}
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
		def invite_params
		  params.require(:invite).permit(:event_id, :user_id, :attending)
		end
end
