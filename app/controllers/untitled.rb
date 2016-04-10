class PingsController < ApplicationController
  before_action :set_device, only: [:create]

  def create
    respond_to do |format|
      format.json { render json: {ping: "success"}, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

end
