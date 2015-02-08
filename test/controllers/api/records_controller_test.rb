require 'test_helper'

class Api::RecordsControllerTest < ActionController::TestCase
  test "should get start_up" do
    get :start_up
    assert_response :success
  end

  test "should get student_check" do
    get :student_check
    assert_response :success
  end

  test "should get check_in" do
    get :check_in
    assert_response :success
  end

  test "should get keep_online" do
    get :keep_online
    assert_response :success
  end

  test "should get check_out" do
    get :check_out
    assert_response :success
  end

  test "should get leave_early" do
    get :leave_early
    assert_response :success
  end

end
