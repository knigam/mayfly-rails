class WelcomeController < ApplicationController
    skip_before_filter :verify_authenticity_token 
    #before_filter :authenticate_user!
    before_filter :json_user_auth
   
    def index
=begin
	Push::MessageGcm.create(
        app: 'Mayfly',
        device: 'APA91bEXWOQnqe0MY9W0Q6nj0jUAMIgO5M-WJ2bPA7xIK1n-h9aBK_IguDGz6l-utY1JUszOxJy5KF2q6AH5Kxb0aTnxcYHvsxYS_8bv200Q2MISqXZJtxCnGzsL0lj7VzDxC1LQ02oPVp3PcbEwhPfsIsUykg2jKg',
        payload: { message: 'Hello World' },
        collapse_key: 'MSG')
=end
    end
end
