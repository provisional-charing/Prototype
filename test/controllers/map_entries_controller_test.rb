require 'test_helper'

class MapEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @map_entry = map_entries(:one)
  end

  test "should get index" do
    get map_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_map_entry_url
    assert_response :success
  end

  test "should create map_entry" do
    assert_difference('MapEntry.count') do
      post map_entries_url, params: { map_entry: { lat: @map_entry.lat, lng: @map_entry.lng, location: @map_entry.location, name: @map_entry.name, phone: @map_entry.phone, plz: @map_entry.plz, spec: @map_entry.spec, street: @map_entry.street } }
    end

    assert_redirected_to map_entry_url(MapEntry.last)
  end

  test "should show map_entry" do
    get map_entry_url(@map_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_map_entry_url(@map_entry)
    assert_response :success
  end

  test "should update map_entry" do
    patch map_entry_url(@map_entry), params: { map_entry: { lat: @map_entry.lat, lng: @map_entry.lng, location: @map_entry.location, name: @map_entry.name, phone: @map_entry.phone, plz: @map_entry.plz, spec: @map_entry.spec, street: @map_entry.street } }
    assert_redirected_to map_entry_url(@map_entry)
  end

  test "should destroy map_entry" do
    assert_difference('MapEntry.count', -1) do
      delete map_entry_url(@map_entry)
    end

    assert_redirected_to map_entries_url
  end
end
