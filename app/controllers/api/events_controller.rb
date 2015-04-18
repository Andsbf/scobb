class Api::EventsController < ApplicationController
  def new

  end

  def index
    @events = Event.all
     render json: @events
  end

  def create
  end

  def update
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def destroy
  end
end
