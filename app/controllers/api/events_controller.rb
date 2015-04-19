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

  end

  def update
  end

  def show
    @event = @course_events.find(params[:id])
    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @client.destroy
  end

  def course_events
    @course = Course.find(params[:course_id])
    @course_events = Course.where(category: @course)
  end
end
