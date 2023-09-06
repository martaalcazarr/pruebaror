require "application_system_test_case"

class MotorsTest < ApplicationSystemTestCase
  setup do
    @motor = motors(:one)
  end

  test "visiting the index" do
    visit motors_url
    assert_selector "h1", text: "Motors"
  end

  test "should create motor" do
    visit motors_url
    click_on "New motor"

    fill_in "Description", with: @motor.description
    fill_in "Equipment type", with: @motor.equipment_type_id
    fill_in "Name", with: @motor.name
    fill_in "Photo", with: @motor.photo
    fill_in "User", with: @motor.user_id
    click_on "Create Motor"

    assert_text "Motor was successfully created"
    click_on "Back"
  end

  test "should update Motor" do
    visit motor_url(@motor)
    click_on "Edit this motor", match: :first

    fill_in "Description", with: @motor.description
    fill_in "Equipment type", with: @motor.equipment_type_id
    fill_in "Name", with: @motor.name
    fill_in "Photo", with: @motor.photo
    fill_in "User", with: @motor.user_id
    click_on "Update Motor"

    assert_text "Motor was successfully updated"
    click_on "Back"
  end

  test "should destroy Motor" do
    visit motor_url(@motor)
    click_on "Destroy this motor", match: :first

    assert_text "Motor was successfully destroyed"
  end
end
