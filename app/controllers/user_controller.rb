class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users = User.all
    render :json => users
  end

  def get
      user = User.find(params[:id])
      render :json => user
  end

  def create
    permitted = params.permit(:name, :phone_num)
    user = User.create(permitted)
    if user.id
      render :json => user
    else
      render status:422, json: user.errors
    end
  end

  def update
    permitted = params.permit(:name, :phone_num)
    user = User.find(params[:id])
    if user.update(permitted)
      render :json => user
    else
      render status:422, json: user.errors
    end
  end

  def delete
      permitted = params.permit(:id)
      user = User.find(params[:id])
      user.destroy if user
      render :json => user
  end
end
