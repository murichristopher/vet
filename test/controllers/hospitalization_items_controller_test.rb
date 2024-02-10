require "test_helper"

class HospitalizationItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospitalization_item = hospitalization_items(:one)
  end

  test "should get index" do
    get hospitalization_items_url
    assert_response :success
  end

  test "should get new" do
    get new_hospitalization_item_url
    assert_response :success
  end

  test "should create hospitalization_item" do
    assert_difference("HospitalizationItem.count") do
      post hospitalization_items_url, params: { hospitalization_item: { name: @hospitalization_item.name, pet_id: @hospitalization_item.pet_id, status: @hospitalization_item.status } }
    end

    assert_redirected_to hospitalization_item_url(HospitalizationItem.last)
  end

  test "should show hospitalization_item" do
    get hospitalization_item_url(@hospitalization_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_hospitalization_item_url(@hospitalization_item)
    assert_response :success
  end

  test "should update hospitalization_item" do
    patch hospitalization_item_url(@hospitalization_item), params: { hospitalization_item: { name: @hospitalization_item.name, pet_id: @hospitalization_item.pet_id, status: @hospitalization_item.status } }
    assert_redirected_to hospitalization_item_url(@hospitalization_item)
  end

  test "should destroy hospitalization_item" do
    assert_difference("HospitalizationItem.count", -1) do
      delete hospitalization_item_url(@hospitalization_item)
    end

    assert_redirected_to hospitalization_items_url
  end
end
