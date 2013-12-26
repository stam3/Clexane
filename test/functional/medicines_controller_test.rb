require 'test_helper'

class MedicinesControllerTest < ActionController::TestCase
  setup do
    @medicine = medicines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicine" do
    assert_difference('Medicine.count') do
      post :create, medicine: { canceledNotificationDate: @medicine.canceledNotificationDate, daysOffset: @medicine.daysOffset, daysOffsetStartDate: @medicine.daysOffsetStartDate, firstHour: @medicine.firstHour, isSpecificDays: @medicine.isSpecificDays, name: @medicine.name, secondHour: @medicine.secondHour, specificDays: @medicine.specificDays }
    end

    assert_redirected_to medicine_path(assigns(:medicine))
  end

  test "should show medicine" do
    get :show, id: @medicine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicine
    assert_response :success
  end

  test "should update medicine" do
    put :update, id: @medicine, medicine: { canceledNotificationDate: @medicine.canceledNotificationDate, daysOffset: @medicine.daysOffset, daysOffsetStartDate: @medicine.daysOffsetStartDate, firstHour: @medicine.firstHour, isSpecificDays: @medicine.isSpecificDays, name: @medicine.name, secondHour: @medicine.secondHour, specificDays: @medicine.specificDays }
    assert_redirected_to medicine_path(assigns(:medicine))
  end

  test "should destroy medicine" do
    assert_difference('Medicine.count', -1) do
      delete :destroy, id: @medicine
    end

    assert_redirected_to medicines_path
  end
end
