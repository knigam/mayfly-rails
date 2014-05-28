namespace :event do
	desc "Destroys events which have already finished"
	task :clean => :environment do
		events = Event.where("end_time < ?", Time.now).destroy_all
	end
end
