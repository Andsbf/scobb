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
  end

  def destroy
  end
end
