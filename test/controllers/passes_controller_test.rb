require 'test_helper'

class PassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pass = passes(:one)
  end

  test "should get index" do
    get passes_url
    assert_response :success
  end

  test "should get new" do
    get new_pass_url
    assert_response :success
  end

  test "should create pass" do
    assert_difference('Pass.count') do
      post passes_url, params: { pass: { date: @pass.date, description: @pass.description, name: @pass.name } }
    end

    assert_redirected_to pass_url(Pass.last)
  end

  test "should show pass" do
    get pass_url(@pass)
    assert_response :success
  end

  test "should get edit" do
    get edit_pass_url(@pass)
    assert_response :success
  end

  test "should update pass" do
    patch pass_url(@pass), params: { pass: { date: @pass.date, description: @pass.description, name: @pass.name } }
    assert_redirected_to pass_url(@pass)
  end

  test "should destroy pass" do
    assert_difference('Pass.count', -1) do
      delete pass_url(@pass)
    end

    assert_redirected_to passes_url
  end
end
