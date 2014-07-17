class ConfirmationsController < Devise::ConfirmationsController
  def show_success
  end

	private
	def after_confirmation_path_for(resource_name, resource)
		'/confirmations/success'
	end
end
