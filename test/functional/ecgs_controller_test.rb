require 'test_helper'

class EcgsControllerTest < ActionController::TestCase
  setup do
    @ecg = ecgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecg" do
    assert_difference('Ecg.count') do
      post :create, ecg: { user_id: @ecg.user_id, value: @ecg.value }
    end

    assert_redirected_to ecg_path(assigns(:ecg))
  end

  test "should show ecg" do
    get :show, id: @ecg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ecg
    assert_response :success
  end

  test "should update ecg" do
    put :update, id: @ecg, ecg: { user_id: @ecg.user_id, value: @ecg.value }
    assert_redirected_to ecg_path(assigns(:ecg))
  end

  test "should destroy ecg" do
    assert_difference('Ecg.count', -1) do
      delete :destroy, id: @ecg
    end

    assert_redirected_to ecgs_path
  end
end
