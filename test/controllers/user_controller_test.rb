require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should be able to get the user with the id" do
      get '/users/298486374'
      assert_response :success
  end

  test "should send status code of 404 if user is missing" do
      get '/users/1'
      assert_response :missing
  end

  test "should be able to create a new user, given the name and phone number" do
      post '/users', params: {
        name: 'test',
        phone_num: 1234567890
      }
      assert_response :success
  end

  test "should send status code of 404 if no user matching phone number is found" do
      get '/users?phone_num=999999'
      assert_response :missing
  end

  test "should respond with a json if matching user is found for the given phone number" do
      get "/users?phone_num=1234567890"
      assert_response :success
  end

  test "should be able to delete a user given his phone number" do
      delete "/users", params: {
        phone_num: 1234567890
      }
      assert_response :success
  end
end
