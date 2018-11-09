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

  test "should get a false status when phone_num length is less than 10" do
    put "/users/1", params: {
      name: 'test',
      phone_num: 1
    }
    json_response = JSON.parse(response.body)
    assert_equal false, json_response
  end

  test "should get a false status when phone_num length is greater than 10" do
    put "/users/1", params: {
      name: 'test',
      phone_num: 12345678901
    }
    json_response = JSON.parse(response.body)
    assert_equal false, json_response
  end

  test "should get a false status when phone_num length is 10, but is not a complete numberal" do
    put "/users/1", params: {
      name: 'test',
      phone_num: '123456789a'
    }
    json_response = JSON.parse(response.body)
    assert_equal false, json_response
  end

  test "should get a true status, ie update the record only when phone_num length is 10" do
    put "/users/1", params: {
      name: 'test',
      phone_num: '1234567890'
    }
    json_response = JSON.parse(response.body)
    assert_equal true, json_response
  end

end
