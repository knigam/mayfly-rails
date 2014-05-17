# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Mayfly::Application.initialize!

# Set up stuff for mailer
#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.smtp_settings = {
#   :tls => true,
#   :address => "smtp.gmail.com",
#   :port => 587,
#   :domain => "gmail.com",
#   :authentication => :login,
#   :user_name => "kushal.nigam1@gmail.com",
#   :password => "tO4toUmi2w2laB"
# }
