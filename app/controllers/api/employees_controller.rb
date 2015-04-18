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
  end

  def destroy
  end
end
