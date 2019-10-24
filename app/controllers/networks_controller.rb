class NetworksController < ApplicationController

  def show
    this_network
    render json: @network
  end

  def update
    this_network
    @contact.update(contact_params) ? render json: @contact : render json: @contact.errors.full_messages, status: :unprocessable_entity
  end

  private

  def this_network
    @network = Network.find(params[:id])
  end

  def network_params
    params.require(:network).permit!
  end

end
