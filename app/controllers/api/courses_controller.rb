class Api::CoursesController < ApplicationController
  def index
   @courses = Course.all
   render json: @courses
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @course = Course.find(params[:id])
    render json: @course
  end

  def update
  end

  def destroy
  end
end
