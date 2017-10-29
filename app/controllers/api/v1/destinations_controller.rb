class Api::V1::DestinationsController < ApplicationController
skip_before_filter :verify_authenticity_token


  def show
    render json: Destination.find(params[:id])
  end

  def create
    require 'pry'; binding.pry
    destination = Destination.new(destination_params)
    if destination.save
    else
      response = "failed to create Destination"
    end
  end

  def update
    destination = Destination.find(params[:id])
    if destination.update(destination_params)
    else
      response = "failed to create Destination"
    end
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
  end

  private

    def destination_params
      params.permit(:name, :zip, :description, :image_url)
    end
end
