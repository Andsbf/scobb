class Api::CategoriesController < ApplicationController
  def index
   @categories = Category.all
   render json: @categories
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  def destroy
  end
end
