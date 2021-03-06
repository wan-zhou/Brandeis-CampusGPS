require 'test_helper'

class RoomsControllerTest < ActionController::TestCase
  setup do
    @room = rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post :create, room: { building_id: @room.building_id, doortag: @room.doortag, floor_id: @room.floor_id, floorplan_x: @room.floorplan_x, floorplan_y: @room.floorplan_y, location_id: @room.location_id, name: @room.name }
    end

    assert_redirected_to room_path(assigns(:room))
  end

  test "should show room" do
    get :show, id: @room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room
    assert_response :success
  end

  test "should update room" do
    patch :update, id: @room, room: { building_id: @room.building_id, doortag: @room.doortag, floor_id: @room.floor_id, floorplan_x: @room.floorplan_x, floorplan_y: @room.floorplan_y, location_id: @room.location_id, name: @room.name }
    assert_redirected_to room_path(assigns(:room))
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete :destroy, id: @room
    end

    assert_redirected_to rooms_path
  end
end
