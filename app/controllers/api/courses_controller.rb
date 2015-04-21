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
    @course = Course.new(course_params)

    if @course.save
      render json: @dependant, status: 200
    else
      render json: {}, status: 400
    end
  end

  def show
    @course = @category_courses.find(params[:id])
    render json: @course
  end

  def update
    @course = course.find(params[:id])

    if @course.update_attributes(course_params)
      render json: @dependant, status: 200
    else
      render json: {}, status: 400
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    render json: {}, status: 200
  end

  private

  def category_courses
    @category = Category.find(params[:category_id])
    @category_courses = Course.where(category: @category)
  end

  def course_params
    params.require(:course).permit(
      :category_id,
      :name,
      :capacity,
      :session_cost
    )
  end
end
