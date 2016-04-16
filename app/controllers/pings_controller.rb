class PingsController < ApplicationController
  before_action :set_device, only: [:create]

  def create
    respond_to do |format|
      @ping = @device.pings.build
      if @ping.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @ping.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

end
