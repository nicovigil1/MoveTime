class Api::V1::FavoritesController < ApplicationController
  def index
    if user = User.find(params[:id])
      render json: FavoritesSerializer.new(user.favorites)
    else 
      render json: {error: "user not found"}
    end
  end 

  def create
    user = User.find(params[:user_id])
    if Favorite.create!(favorite_params)
      clean_params
      render json: params
    else 
      render json: {error: "an error occurred"}, status: 401
    end 
  end 
  
  def destroy 
    if user = User.find(params[:user_id])
      yuh = user.favorites.where(user_id: user.id)[0].destroy
    end
  end 

  private 

  def clean_params
    params.delete("controller")
    params.delete("action")
  end 
  
  def favorite_params
    params.permit(:user_id, :city_id, :walkers, :cyclists, :property_val, :population, :city)
  end
end 