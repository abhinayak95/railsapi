class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  def get_by_phone_num
    phone_num = params[:phone_num]
    users = User.find_by_phone_num(phone_num)
    if users
      render :json => users
    else
      render :json => { message: 'not found'}
    end
  end

  def create
    p params
    is_created = User.create(name:params[:name], phone_num: params[:phone_num])
    p is_created
    if is_created
      render :json => { message: 'User created!'}
    else
      render :json => { message: 'Unable to create user'}
    end
  end

  def delete
    records = User.find_by_phone_num(params[:phone_num])
    records.destroy if records
    render :json => { message: 'User deleted successfully'}
  end
end
