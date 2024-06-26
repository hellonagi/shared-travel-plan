require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end
  test 'login with valid name/invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { name: @user.name, password: '' } }
    assert_not is_logged_in?
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with valid information followed by logout' do
    post login_path, params: { session: { name: @user.name,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'maps/index'
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path
    delete logout_path
    assert_not is_logged_in?
    assert_response :see_other
    assert_redirected_to root_url
    follow_redirect!
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', logout_path, count: 0
  end
end
