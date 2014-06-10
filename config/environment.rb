# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Mayfly::Application.initialize!

# Set up stuff for mailer
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	 :enable_starttls_auto => true,
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "mymayfly.com",
   :authentication => "plain",
   :user_name => "mayflymailer@gmail.com",
   :password => "intL0Mwsl,T1pw2rt@"
}
