require 'test_helper'

class Admin::ConfigurationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_configurations_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_configurations_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_configurations_update_url
    assert_response :success
  end

  test "should get confirm" do
    get admin_configurations_confirm_url
    assert_response :success
  end

  test "should get withdrawal" do
    get admin_configurations_withdrawal_url
    assert_response :success
  end

end
