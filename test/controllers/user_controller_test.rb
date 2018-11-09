require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should be able to get the user with the id" do
      get '/users/298486374'
      assert_response :success
  end

  test "should be able to create a new user, given the name and phone number" do
      post '/users', params: {
        name: 'test',
        phone_num: 1234567890
      }
      assert_response :success
  end

  test "should respond with a json if matching user is found for the given phone number" do
      get "/users?phone_num=1234567890"
      assert_response :success
  end

  test "should be able to delete a user given his id" do
      delete "/users", params: {
        id: 999
      }
      assert_response :success
  end
end
