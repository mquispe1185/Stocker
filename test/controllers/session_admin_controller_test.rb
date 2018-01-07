require 'test_helper'

class SessionAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_admin_new_url
    assert_response :success
  end

  test "should get create" do
    get session_admin_create_url
    assert_response :success
  end

  test "should get destroy" do
    get session_admin_destroy_url
    assert_response :success
  end

end
