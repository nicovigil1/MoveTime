class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_or_create_by(user_params)
    if user.save
      render json: {success: "user successfully created / logged in", id: user.id, username: user.username}, status: 201
    else
      render json: {error: "an error occured"}, status: 401
    end 
  end

  private

  def user_params
    params.permit(:password, :username)
  end
end