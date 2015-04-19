class Api::CategoriesController < ApplicationController
  def index
   @categories = Category.all
   render json: @categories
  end

  def create
  end

  def update
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end
end
