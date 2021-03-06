require 'test_helper'

module Signup
  class UsersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    def setup
      @user = users(:one)
      @other_user = users(:two)
    end

    test 'should redirect index when not logged in' do
      get :index
      assert_redirected_to login_url
    end

    test 'should get new when logged in admin user' do
      log_in_as(@user)
      get :new
      assert_response :success
    end

    test 'should get new when logged in other user' do
      log_in_as(@other_user)
      assert_no_difference 'User.count' do
        get :new
      end
      assert_redirected_to admin_url
    end

    test 'should redirect edit when not logged in' do
      get :edit, id: @user
      assert_redirected_to login_url
    end

    test 'should redirect update when not logged in' do
      patch :update, id: @user, user: {name: @user.name, email: @user.email}
      assert_redirected_to login_url
    end

    test 'should redirect edit when logged in as wrong user' do
      log_in_as(@other_user)
      get :edit, id: @user
      assert_redirected_to admin_url
    end

    test 'should redirect update when logged in as wrong user' do
      log_in_as(@other_user)
      patch :update, id: @user, user: {name: @user.name, email: @user.email}
      assert_redirected_to admin_url
    end

    test 'should redirect destroy when not logged in' do
      assert_no_difference 'User.count' do
        delete :destroy, id: @user
      end
      assert_redirected_to login_url
    end

    test 'should redirect destroy when logged in as a non-admin' do
      log_in_as(@other_user)
      assert_no_difference 'User.count' do
        delete :destroy, id: @user
      end
      assert_redirected_to admin_url
    end
   end
end
