class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def create    
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: 200
    else
      render json: {}, status: 400
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      render json: @category, status: 200
    else
      render json: {}, status: 400
    end
  end

  def show
    @category = Category.find(params[:id])
    render json: @category, status: 200
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render json: {}, status: 200
  end

  private

    def category_params
      params.require(:category).permit(
        :title,
        :description
      )
    end

end
