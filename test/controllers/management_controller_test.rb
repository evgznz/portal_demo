require 'test_helper'

class ManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get management_index_url
    assert_response :success
  end

  test "should get create" do
    get management_create_url
    assert_response :success
  end

  test "should get update" do
    get management_update_url
    assert_response :success
  end

  test "should get destroy" do
    get management_destroy_url
    assert_response :success
  end

  test "should get new" do
    get management_new_url
    assert_response :success
  end

  test "should get show" do
    get management_show_url
    assert_response :success
  end

end
