require "test_helper"

class ServiceQueueItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_queue_item = service_queue_items(:one)
  end

  test "should get index" do
    get service_queue_items_url
    assert_response :success
  end

  test "should get new" do
    get new_service_queue_item_url
    assert_response :success
  end

  test "should create service_queue_item" do
    assert_difference("ServiceQueueItem.count") do
      post service_queue_items_url, params: { service_queue_item: { customer_id: @service_queue_item.customer_id, pet_id: @service_queue_item.pet_id, queue_name: @service_queue_item.queue_name, status: @service_queue_item.status, urgency: @service_queue_item.urgency } }
    end

    assert_redirected_to service_queue_item_url(ServiceQueueItem.last)
  end

  test "should show service_queue_item" do
    get service_queue_item_url(@service_queue_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_queue_item_url(@service_queue_item)
    assert_response :success
  end

  test "should update service_queue_item" do
    patch service_queue_item_url(@service_queue_item), params: { service_queue_item: { customer_id: @service_queue_item.customer_id, pet_id: @service_queue_item.pet_id, queue_name: @service_queue_item.queue_name, status: @service_queue_item.status, urgency: @service_queue_item.urgency } }
    assert_redirected_to service_queue_item_url(@service_queue_item)
  end

  test "should destroy service_queue_item" do
    assert_difference("ServiceQueueItem.count", -1) do
      delete service_queue_item_url(@service_queue_item)
    end

    assert_redirected_to service_queue_items_url
  end
end
