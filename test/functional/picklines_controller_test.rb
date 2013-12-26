require 'test_helper'

class PicklinesControllerTest < ActionController::TestCase
  setup do
    @pickline = picklines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:picklines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pickline" do
    assert_difference('Pickline.count') do
      post :create, pickline: { bandage_interval_days: @pickline.bandage_interval_days, bandage_replacement_date: @pickline.bandage_replacement_date, blue_last_wash_date: @pickline.blue_last_wash_date, blue_ventile_replacement_date: @pickline.blue_ventile_replacement_date, parpar_replacement_date: @pickline.parpar_replacement_date, red_last_wash_date: @pickline.red_last_wash_date, red_ventile_replacement_date: @pickline.red_ventile_replacement_date, user_id: @pickline.user_id }
    end

    assert_redirected_to pickline_path(assigns(:pickline))
  end

  test "should show pickline" do
    get :show, id: @pickline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pickline
    assert_response :success
  end

  test "should update pickline" do
    put :update, id: @pickline, pickline: { bandage_interval_days: @pickline.bandage_interval_days, bandage_replacement_date: @pickline.bandage_replacement_date, blue_last_wash_date: @pickline.blue_last_wash_date, blue_ventile_replacement_date: @pickline.blue_ventile_replacement_date, parpar_replacement_date: @pickline.parpar_replacement_date, red_last_wash_date: @pickline.red_last_wash_date, red_ventile_replacement_date: @pickline.red_ventile_replacement_date, user_id: @pickline.user_id }
    assert_redirected_to pickline_path(assigns(:pickline))
  end

  test "should destroy pickline" do
    assert_difference('Pickline.count', -1) do
      delete :destroy, id: @pickline
    end

    assert_redirected_to picklines_path
  end
end
