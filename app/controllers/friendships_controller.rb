class FriendshipsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@email = params[:email]
		if current_user.email == params[:email]
				return render :json => {:success => false, :message => "You can\'t add yourself as a friend"}
		end
		@friend = User.find_by_email(params[:email])
		if not @friend
			return render :json => {:success => false, :message => "User does not exist"}
		end
		@friendship = current_user.friendships.build(:friend_id => @friend.id, :friend_name => @friend.name)
		if @friendship.save
			return render :json => {:success => true}
		else
			return render :json => {:success => false, :message => "User is already a friend"}
		end
	end

	def bulk_create
		@emails = params[:emails]
		totalSuccess = 0
		totalFailed = 0
		@emails.each do |e|
			@friend = User.find_by_email(e)
			if @friend && current_user.email != @friend.email
				@friendship = current_user.friendships.build(:friend_id => @friend.id, :friend_name => @friend.name)
				if @friendship.save
					totalSuccess += 1
				else
					totalFailed += 1
				end
			end
		end
		return render :json => {:succeeded => totalSuccess, :failed => totalFailed }
	end

	def create_from_event
		@event = Event.find(params[:event_id])
		@users = @event.invites.where(attending: true).map{|i| i.user}
		@users = @users - [current_user]
		if @users.count == 0
			return render :json => {:success => false, :message => "No users to add as friends"}
		else
			@users.each do |u|
				current_user.friendships.create(friend_id: u.id, friend_name: u.name)
			end
		end
		return render :json => {:success => true}
	end

	def destroy
		@friendship = current_user.friendships.find_by_friend_id(params[:id])
		if @friendship.destroy
			return render :json => {:success => true}
		else
			return render :json => {:success => false, :message => "Could not delete friend"}
		end
	end
	
	def show
    friends_list = current_user.friendships.map{|f| {id: f.friend.id, name: f.friend_name}}
		friends_list.sort_by!{|f| f[:name]}
		return render :json => {:friends => friends_list}
	end
end
