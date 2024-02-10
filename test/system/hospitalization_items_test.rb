require "application_system_test_case"

class HospitalizationItemsTest < ApplicationSystemTestCase
  setup do
    @hospitalization_item = hospitalization_items(:one)
  end

  test "visiting the index" do
    visit hospitalization_items_url
    assert_selector "h1", text: "Hospitalization items"
  end

  test "should create hospitalization item" do
    visit hospitalization_items_url
    click_on "New hospitalization item"

    fill_in "Name", with: @hospitalization_item.name
    fill_in "Pet", with: @hospitalization_item.pet_id
    fill_in "Status", with: @hospitalization_item.status
    click_on "Create Hospitalization item"

    assert_text "Hospitalization item was successfully created"
    click_on "Back"
  end

  test "should update Hospitalization item" do
    visit hospitalization_item_url(@hospitalization_item)
    click_on "Edit this hospitalization item", match: :first

    fill_in "Name", with: @hospitalization_item.name
    fill_in "Pet", with: @hospitalization_item.pet_id
    fill_in "Status", with: @hospitalization_item.status
    click_on "Update Hospitalization item"

    assert_text "Hospitalization item was successfully updated"
    click_on "Back"
  end

  test "should destroy Hospitalization item" do
    visit hospitalization_item_url(@hospitalization_item)
    click_on "Destroy this hospitalization item", match: :first

    assert_text "Hospitalization item was successfully destroyed"
  end
end
