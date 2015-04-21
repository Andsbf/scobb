class Api::EventsController < ApplicationController
  before_action :course_events
  skip_before_action :course_events, only: [:all]

  def all
    @events = Event.all
    render json: @events
  end

  def index
    @events = @course_events
     render json: @events
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: 'ok', status: 200
    else
      render json: "", status: 400
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      render json: 'ok'
    else
      render json: 'error'
    end
  end

  def show
    @event = @course_events.find(params[:id])
    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    render json: 'ok', status: 200
  end

  private

    def course_events
      @course = Course.find(params[:course_id])
      @course_events = Course.where(category: @course)
    end

    def event_params
      params.require(:event).permit(
        :employee_id,
        :course_id,
        :start_time,
        :duration
      )
    end
end
