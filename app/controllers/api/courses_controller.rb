class Api::CoursesController < ApplicationController
  
  before_action :category_courses
  skip_before_action :category_courses, only: [:all]

  def all
    @courses = Course.all
    render json: @courses
  end

  def index
   @courses = @category_courses
   render json: @courses
  end

  def create
  end

  def show
    @course = @category_courses.find(params[:id])
    render json: @course
  end

  def update
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
  end

  protected

  def category_courses
    @category = Category.find(params[:category_id])
    @category_courses = Course.where(category: @category)
  end


end
