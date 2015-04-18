class Api::DependantsController < ApplicationController
  def index
    @depedants = Dependant.all
    render json: @depedants
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
