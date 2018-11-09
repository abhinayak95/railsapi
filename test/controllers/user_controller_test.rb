require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should be able to get all the users" do
      get '/users'
      json_response = JSON.parse(response.body)
      assert_equal 2, json_response.length
  end

  test "should be able to get the user with the id" do
      get '/users/1'
      json_response = JSON.parse(response.body)
      assert_equal 1, json_response['id']
  end

  test "should be able to create a new user, given the name and phone number" do
      post '/users', params: {
        name: 'test',
        phone_num: 1234567890
      }
      json_response = JSON.parse(response.body)
      assert_equal 'test', json_response['name']
  end

  test "should respond with a json if matching user is found for the given phone number" do
      get "/users?phone_num=1234567890"
      assert_response :success
  end

  test "throws an error if no record is found for the given id" do
      assert_raises (ActiveRecord::RecordNotFound) do
        delete "/users", params: {
          id: 999
        }
      end
  end

  test "should be able to delete the user with an id" do
      delete "/users", params: {
        id: 2
      }
      json_response = JSON.parse(response.body)
      assert_equal 'test2', json_response["name"]
  end
end
