require "test_helper"

class MaintenanceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_type = maintenance_types(:one)
  end

  test "should get index" do
    get maintenance_types_url
    assert_response :success
  end

  test "should get new" do
    get new_maintenance_type_url
    assert_response :success
  end

  test "should create maintenance_type" do
    assert_difference("MaintenanceType.count") do
      post maintenance_types_url, params: { maintenance_type: { name: @maintenance_type.name } }
    end

    assert_redirected_to maintenance_type_url(MaintenanceType.last)
  end

  test "should show maintenance_type" do
    get maintenance_type_url(@maintenance_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintenance_type_url(@maintenance_type)
    assert_response :success
  end

  test "should update maintenance_type" do
    patch maintenance_type_url(@maintenance_type), params: { maintenance_type: { name: @maintenance_type.name } }
    assert_redirected_to maintenance_type_url(@maintenance_type)
  end

  test "should destroy maintenance_type" do
    assert_difference("MaintenanceType.count", -1) do
      delete maintenance_type_url(@maintenance_type)
    end

    assert_redirected_to maintenance_types_url
  end
end
