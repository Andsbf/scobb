class Api::EmployeesController < ApplicationController
  def index
   @employees = Employee.all
   render json: @employees
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end

  def destroy
  end
end
