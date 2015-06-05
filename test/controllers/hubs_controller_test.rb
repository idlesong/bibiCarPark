require 'test_helper'

class HubsControllerTest < ActionController::TestCase
  setup do
    @hub = hubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hub" do
    assert_difference('Hub.count') do
      post :create, hub: { hardware_id: @hub.hardware_id, max_nodes: @hub.max_nodes, status: @hub.status }
    end

    assert_redirected_to hub_path(assigns(:hub))
  end

  test "should show hub" do
    get :show, id: @hub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hub
    assert_response :success
  end

  test "should update hub" do
    patch :update, id: @hub, hub: { hardware_id: @hub.hardware_id, max_nodes: @hub.max_nodes, status: @hub.status }
    assert_redirected_to hub_path(assigns(:hub))
  end

  test "should destroy hub" do
    assert_difference('Hub.count', -1) do
      delete :destroy, id: @hub
    end

    assert_redirected_to hubs_path
  end
end
