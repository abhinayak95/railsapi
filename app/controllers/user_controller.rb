class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  attr_accessor :users
  def index
    users = User.all
    render :json => users
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
    user = User.create(permitted)
      render :json => user
  end

  def delete
    permitted = params.permit(:id)
    user = User.find(params[:id])
    user.destroy if user
    render :json => user
  end
end
