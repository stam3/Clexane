require 'test_helper'

class MedicineHistoriesControllerTest < ActionController::TestCase
  setup do
    @medicine_history = medicine_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicine_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicine_history" do
    assert_difference('MedicineHistory.count') do
      post :create, medicine_history: { actualHour: @medicine_history.actualHour, isFirstHour: @medicine_history.isFirstHour, medicineID: @medicine_history.medicineID, type: @medicine_history.type }
    end

    assert_redirected_to medicine_history_path(assigns(:medicine_history))
  end

  test "should show medicine_history" do
    get :show, id: @medicine_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicine_history
    assert_response :success
  end

  test "should update medicine_history" do
    put :update, id: @medicine_history, medicine_history: { actualHour: @medicine_history.actualHour, isFirstHour: @medicine_history.isFirstHour, medicineID: @medicine_history.medicineID, type: @medicine_history.type }
    assert_redirected_to medicine_history_path(assigns(:medicine_history))
  end

  test "should destroy medicine_history" do
    assert_difference('MedicineHistory.count', -1) do
      delete :destroy, id: @medicine_history
    end

    assert_redirected_to medicine_histories_path
  end
end
