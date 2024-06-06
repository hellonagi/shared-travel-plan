require "test_helper"

class TodolistControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get todolist_new_url
    assert_response :success
  end

  test "should get show" do
    get todolist_show_url
    assert_response :success
  end

  test "should get edit" do
    get todolist_edit_url
    assert_response :success
  end
end
