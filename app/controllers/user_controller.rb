class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    user = User.all
    render :json => user
  end

  def get
    begin
      user = User.find(params[:id])
      render :json => user
    rescue ActiveRecord::RecordNotFound
    end
  end

  def create
    permitted = params.permit(:name, :phone_num)
    p params
    user = User.create(permitted)
      render :json => user
  end

  def delete
    user = User.find(params[:id])
    user.destroy if user
    render :json => user
  end
end
