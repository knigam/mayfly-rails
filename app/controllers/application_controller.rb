class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :json
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

=begin 
  def my_user_auth
    respond_to do |format|
      format.html {:authenticate_user!}
      format.json {:json_user_auth}
    end
  end
=end
  def json_user_auth   
    if current_user
      return render :json => {:success => "true", :email => current_user.email, :authenticity_token => form_authenticity_token}
    else
      return render :json => {:success => "false", :error => "User is not signed in", :authenticity_token => form_authenticity_token}
    end
  end
end
