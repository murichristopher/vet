require "application_system_test_case"

class ServiceQueueItemsTest < ApplicationSystemTestCase
  setup do
    @service_queue_item = service_queue_items(:one)
  end

  test "visiting the index" do
    visit service_queue_items_url
    assert_selector "h1", text: "Service queue items"
  end

  test "should create service queue item" do
    visit service_queue_items_url
    click_on "New service queue item"

    fill_in "Customer", with: @service_queue_item.customer_id
    fill_in "Pet", with: @service_queue_item.pet_id
    fill_in "Queue name", with: @service_queue_item.queue_name
    fill_in "Status", with: @service_queue_item.status
    check "Urgency" if @service_queue_item.urgency
    click_on "Create Service queue item"

    assert_text "Service queue item was successfully created"
    click_on "Back"
  end

  test "should update Service queue item" do
    visit service_queue_item_url(@service_queue_item)
    click_on "Edit this service queue item", match: :first

    fill_in "Customer", with: @service_queue_item.customer_id
    fill_in "Pet", with: @service_queue_item.pet_id
    fill_in "Queue name", with: @service_queue_item.queue_name
    fill_in "Status", with: @service_queue_item.status
    check "Urgency" if @service_queue_item.urgency
    click_on "Update Service queue item"

    assert_text "Service queue item was successfully updated"
    click_on "Back"
  end

  test "should destroy Service queue item" do
    visit service_queue_item_url(@service_queue_item)
    click_on "Destroy this service queue item", match: :first

    assert_text "Service queue item was successfully destroyed"
  end
end
