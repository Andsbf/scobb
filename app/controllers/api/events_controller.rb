class Api::EventsController < ApplicationController

  def index
    @events = Event.all
     render json: @events, status: 200
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: 200
    else
      render json: {}, status: 400
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      render json: @event, status: 200
    else
      render json: {}, status: 400
    end
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    render json: {}, status: 200
  end

  private

    def event_params
      params.require(:event).permit(
        :employee_id,
        :course_id,
        :start_time,
        :duration
      )
    end
end
