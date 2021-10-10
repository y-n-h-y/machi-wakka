require 'test_helper'

class Admin::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_shops_top_url
    assert_response :success
  end

  test "should get new" do
    get admin_shops_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_shops_show_url
    assert_response :success
  end

  test "should get create" do
    get admin_shops_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_shops_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_shops_update_url
    assert_response :success
  end

end
