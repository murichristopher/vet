require "application_system_test_case"

class ServiceOrdersTest < ApplicationSystemTestCase
  setup do
    @service_order = service_orders(:one)
  end

  test "visiting the index" do
    visit service_orders_url
    assert_selector "h1", text: "Service orders"
  end

  test "should create service order" do
    visit service_orders_url
    click_on "New service order"

    fill_in "Customer", with: @service_order.customer_id
    fill_in "Description", with: @service_order.description
    fill_in "Inventory items", with: @service_order.inventory_items_id
    fill_in "Pet", with: @service_order.pet_id
    fill_in "Price", with: @service_order.price
    click_on "Create Service order"

    assert_text "Service order was successfully created"
    click_on "Back"
  end

  test "should update Service order" do
    visit service_order_url(@service_order)
    click_on "Edit this service order", match: :first

    fill_in "Customer", with: @service_order.customer_id
    fill_in "Description", with: @service_order.description
    fill_in "Inventory items", with: @service_order.inventory_items_id
    fill_in "Pet", with: @service_order.pet_id
    fill_in "Price", with: @service_order.price
    click_on "Update Service order"

    assert_text "Service order was successfully updated"
    click_on "Back"
  end

  test "should destroy Service order" do
    visit service_order_url(@service_order)
    click_on "Destroy this service order", match: :first

    assert_text "Service order was successfully destroyed"
  end
end
