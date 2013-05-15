require 'test_helper'

class ItypesControllerTest < ActionController::TestCase
  setup do
    @itype = itypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itype" do
    assert_difference('Itype.count') do
      post :create, itype: { name: @itype.name }
    end

    assert_redirected_to itype_path(assigns(:itype))
  end

  test "should show itype" do
    get :show, id: @itype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itype
    assert_response :success
  end

  test "should update itype" do
    put :update, id: @itype, itype: { name: @itype.name }
    assert_redirected_to itype_path(assigns(:itype))
  end

  test "should destroy itype" do
    assert_difference('Itype.count', -1) do
      delete :destroy, id: @itype
    end

    assert_redirected_to itypes_path
  end
end
