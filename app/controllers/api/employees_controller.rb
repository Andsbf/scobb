class Api::EmployeesController < ApplicationController

  def index
   @employees = Employee.all
   render json: @employees
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: 200
    else
      render json: {}, status: 400
    end
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update_attributes(employee_params)
      render json: @employee, status: 200
    else
      render json: {}, status: 400
    end
  end

  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    render json: {}, status: 200
  end

  private

    def employee_params
      params.require(:employee).permit(
        :certification,
        :hourly_rate,
        :user_id,
        :privelege_id
      )
    end
end
