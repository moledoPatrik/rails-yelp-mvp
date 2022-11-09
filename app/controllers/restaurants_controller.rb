class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(permitted_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render new_restaurant_path, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
