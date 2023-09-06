require "application_system_test_case"

class MaintenanceTypesTest < ApplicationSystemTestCase
  setup do
    @maintenance_type = maintenance_types(:one)
  end

  test "visiting the index" do
    visit maintenance_types_url
    assert_selector "h1", text: "Maintenance types"
  end

  test "should create maintenance type" do
    visit maintenance_types_url
    click_on "New maintenance type"

    fill_in "Name", with: @maintenance_type.name
    click_on "Create Maintenance type"

    assert_text "Maintenance type was successfully created"
    click_on "Back"
  end

  test "should update Maintenance type" do
    visit maintenance_type_url(@maintenance_type)
    click_on "Edit this maintenance type", match: :first

    fill_in "Name", with: @maintenance_type.name
    click_on "Update Maintenance type"

    assert_text "Maintenance type was successfully updated"
    click_on "Back"
  end

  test "should destroy Maintenance type" do
    visit maintenance_type_url(@maintenance_type)
    click_on "Destroy this maintenance type", match: :first

    assert_text "Maintenance type was successfully destroyed"
  end
end
