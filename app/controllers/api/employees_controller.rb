class Api::EmployeesController < ApplicationController

  def index
   @employees = Employee.all
   render json: @employees
  end

  def create
    @employee = Employee.new(processed_employee_params)

    if @employee.save
      render json: @employee, status: 200
    else
      render json: {}, status: 400
    end
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update_attributes(processed_employee_params)
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

    def processed_employee_params
    
      address_concat = [
        employee_params.a_unit,
        employee_params.a_postal,
        employee_params.a_number,
        employee_params.a_street,
        employee_params.a_city].join(',')

      employee_params.merger(address: address_concat)

    end

    def employee_params
      params.require(:employee).permit(
      :first_name,
      :last_name,
      :email,
      :phone,
      :phone_alternate,
      :birthday,
      :gender,
      :a_unit,
      :a_postal,
      :a_number,
      :a_street,
      :a_city,
      :notes,
      :password,
      :password_confirmation,
      :certification,
      :hourly_rate
      )
    end
end
