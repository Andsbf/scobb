class Api::RegistrationsController < ApplicationController

  def index
    @registrations = Registration.all
     render json: @registrations
  end

  def create
  end

  def destroy
  end

  def show
    @registration = Registration.find(params[:id])
    render json: @registration
  end

  def update
  end
end
