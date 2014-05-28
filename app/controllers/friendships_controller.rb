class FriendshipsController < ApplicationController
	before_filter :authenticate_user!

	def create
		if current_user.email == params[:email]
			return render :json => {:success => false, :message => "You can\'t add yourself as a friend"}
		end
		
		@friend = User.find_by_email(params[:email])
		
		if not @friend
			return render :json => {:success => false, :message => "User does not exist"}
		end
		
		@friendship = current_user.friendships.build(:friend_id => @friend.id, :friend_name => @friend.name )
		if @friendship.save
			return render :json => {:success => true}
		else
			return render :json => {:success => false, :message => "User is already a friend"}
		end
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
