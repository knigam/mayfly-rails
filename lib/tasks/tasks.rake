namespace :event do
	desc "Sets events which have already finished to inactve"
	task :deactivate => :environment do
		Event.where("end_time < ?", Time.now).update_all(active: false)
	end

	desc "Destroys all events which are inactive"
	task :clean => :environment do
		Event.where(active: false).destroy_all
	end
end
