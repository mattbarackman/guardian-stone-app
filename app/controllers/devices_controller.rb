class DevicesController < ApplicationController
  before_action :set_device, :except => [:index, :new, :create]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, flash: { info: 'Device was successfully created.' }}
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, flash: { info: 'Device was successfully updated.' }}
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, flash: { info: 'Device was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end

  def on
    @device.turn_on!
    render json: {}, status: :success
  end

  def off
    @device.turn_off!
    render json: {}, status: :success
  end

  def battery
    level = @device.battery_level
    # level = 8 
    case
    when level <= 2
      redirect_to @device, flash: {:danger => "Battery is low at #{level * 10}%."}
    when level <= 5
      redirect_to @device, flash: {:warning => "Battery is okay at #{level * 10}%."}
    else
      redirect_to @device, flash: {:success => "Battery is great at #{level * 10}%."}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:timestamps, :name, :particle_id)
    end
end
