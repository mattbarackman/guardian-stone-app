class LocationsController < ApplicationController

  before_action :set_device
  protect_from_forgery :except => :create
  
  def create
    @location = @device.locations.build(location_params)

    respond_to do |format|
      if @location.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find_by_particle_id(params[:device_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:latitude, :longitude)
    end
end
