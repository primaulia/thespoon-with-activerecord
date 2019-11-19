class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  # get 'restaurants/:id', to: 'restaurants#show'
  # localhost:3000/restaurants/4456547
  def show    
  end

  def new
    # blank resto
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    new_restaurant = Restaurant.new(restaurant_params)

    # if save happened returns true, redirect to index page
    if new_restaurant.save
      redirect_to restaurants_path(new_restaurant)
    else
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :stars, :chef_name)
  end
end
