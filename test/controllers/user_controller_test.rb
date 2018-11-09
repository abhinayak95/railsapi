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
end
