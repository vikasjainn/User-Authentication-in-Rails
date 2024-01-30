require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should register a user' do
    post register_url, params: { user: { username: 'testuser', password: 'password' } }
    assert_response :created
  end

  test 'should not register a user with invalid data' do
    post register_url, params: { user: { username: '', password: 'password' } }
    assert_response :unprocessable_entity
  end

  # Add similar tests for login and logout actions
end
