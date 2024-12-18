require "test_helper"

class EventTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_type = event_types(:one)
  end

  test "should get index" do
    get event_types_url, as: :json
    assert_response :success
  end

  test "should create event_type" do
    assert_difference("EventType.count") do
      post event_types_url, params: { event_type: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show event_type" do
    get event_type_url(@event_type), as: :json
    assert_response :success
  end

  test "should update event_type" do
    patch event_type_url(@event_type), params: { event_type: {  } }, as: :json
    assert_response :success
  end

  test "should destroy event_type" do
    assert_difference("EventType.count", -1) do
      delete event_type_url(@event_type), as: :json
    end

    assert_response :no_content
  end
end
