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
  end

  def destroy
  end
end
