require 'test_helper'

class ClexaneHistoriesControllerTest < ActionController::TestCase
  setup do
    @clexane_history = clexane_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clexane_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clexane_history" do
    assert_difference('ClexaneHistory.count') do
      post :create, clexane_history: { dosage: @clexane_history.dosage, index: @clexane_history.index, isRight: @clexane_history.isRight, shotDate: @clexane_history.shotDate, user_id: @clexane_history.user_id }
    end

    assert_redirected_to clexane_history_path(assigns(:clexane_history))
  end

  test "should show clexane_history" do
    get :show, id: @clexane_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clexane_history
    assert_response :success
  end

  test "should update clexane_history" do
    put :update, id: @clexane_history, clexane_history: { dosage: @clexane_history.dosage, index: @clexane_history.index, isRight: @clexane_history.isRight, shotDate: @clexane_history.shotDate, user_id: @clexane_history.user_id }
    assert_redirected_to clexane_history_path(assigns(:clexane_history))
  end

  test "should destroy clexane_history" do
    assert_difference('ClexaneHistory.count', -1) do
      delete :destroy, id: @clexane_history
    end

    assert_redirected_to clexane_histories_path
  end
end
