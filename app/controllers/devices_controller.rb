class DevicesController < ApplicationController
  #skip_before_filter :verify_authenticity_token #, :only => [:create, :failure]
  before_filter :authenticate_user!

  def create
    device = current_user.devices.build(device_params)
    if device.save
      return render :json => {:success => "true", :id => device.id, :message => "Device registered"}
    else
      device = Device.find_by reg_id: device.reg_id
      device.assign_attributes(device_params) 
			device.user = current_user
			if device.save
  			return render :json => {:success => "true", :id => device.id, :message => "Device registration updated"}
      else
        return render :json => {:success => "false"}
      end
    end
  end
  
  def update
    device = Device.find_by reg_id: device.reg_id
		device.assign_attributes(device_params)
		device.user = current_user

    if device.save
      return render :json => {:success => "true", :id => device.id, :message => "Device registration updated"}
    else
      return render :json => {:success => "false"}
    end
  end

  def destroy
    device = current_user.devices.where(params[:reg_id]).first
    if device.destroy
      return render :json => {:success => "true", :message => "Device unregistered"}
    else
      return render :json => {:success => "false"}
    end
  end

  private
    def device_params
      params.require(:device).permit(:reg_id, :type, :latitude, :longitude)
    end
end
