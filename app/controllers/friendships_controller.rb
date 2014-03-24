class FriendshipsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			return render :json => {:success => 'true'}
		else
			return render :json => {:success => 'false'}
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		if @friendship.destroy
			return render :json => {:success => 'true'}
		else
			return render :json => {:success => 'false'}
		end
	end
end
