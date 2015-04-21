class Api::PrivilegesController < ApplicationController
  
  def index
    @privileges = Privilege.all
    render json: @privileges, status: 200
  end

  def create
   @privilege = Privilege.new(privilege_params)

    if @privilege.save
      render json: @privilege, status: 200
    else
      render json: {}, status: 404
    end
  end

  def show
    @privilege = Privilege.find(params[:id])
    render json: @privilege, status: 200
  end

  def update
    @privilege = Privilege.find(params[:id])

    if @privilege.update_attributes(privilege_params)
      render json: @privilege, status: 200
    else
      render json: {}, status: 404
    end
  end

  def destroy
    @privilege = Privilege.find(params[:id])
    @privilege.destroy
    render json: {}, status: 200
  end

  private

  def privilige_params
    params.require(:privilige).permit(
      :privileges1,
      :priveleges2,
      :priveleges3,
      :priveleges4
      )
  end

end
