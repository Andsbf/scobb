class Api::RegistrationsController < ApplicationController

  def index
    @registrations = Registration.all
     render json: @registrations, status: 200
  end

  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      render json: @registration, status: 200
    else
      render json: {}, status: 404
    end
  end

  def show
    @registration = Registration.find(params[:id])
    render json: @registration, status: 200
  end

  def update
    @registration = Registration.find(params[:id])

    if @registration.update_attributes(registration_params)
      render json: @registration, status: 200
    else
      render json: {}, status: 404
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    render json: {}, status: 200
  end

  private

    def registration_params
      params.require(:registration).permit(
        :payment_id,
        :client_id,
        :dependant_id,
        :course_id
      )
    end
end
