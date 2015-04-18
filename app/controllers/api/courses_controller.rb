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
  end

  def update
  end

  def destroy
  end
end
