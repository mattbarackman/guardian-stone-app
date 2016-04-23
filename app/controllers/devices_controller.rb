class DevicesController < ApplicationController
  before_action :set_device, :except => [:index, :new, :create]

  def index
    @devices = Device.all
  end

  def show
    @hash = Gmaps4rails.build_markers(@device.nearby_locations) do |loc, marker|
      marker.lat loc.latitude
      marker.lng loc.longitude
    end
  end

  def new
    @device = Device.new
  end

  def edit
  end

  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to device_path(@device.particle_id), flash: { info: 'Device was successfully created.' }}
        format.json { render :show, status: :created, location: device_path(@device.particle_id) }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to device_path(@device.particle_id), flash: { info: 'Device was successfully updated.' }}
        format.json { render :show, status: :ok, location: device_path(@device.particle_id) }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def on
    @device.turn_on!
    redirect_to device_dashboard_path(@device), flash: { success: 'Device was turned on.' }
  end

  def off
    @device.turn_off!
    redirect_to device_dashboard_path(@device), flash: { success: 'Device was turned on.' }
  end


  def dashboard
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find_by_particle_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:timestamps, :name, :particle_id)
    end
end
